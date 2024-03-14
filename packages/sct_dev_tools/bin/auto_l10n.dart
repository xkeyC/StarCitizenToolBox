import 'dart:convert';
import 'dart:io';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:uuid/v4.dart';

final stringResult = <String>[];

class AutoL10nTools {
  void genL10nFiles() {
    final dir = Directory('lib/ui');
    for (var entity in dir.listSync(recursive: true)) {
      if (entity is File && entity.path.endsWith('.dart')) {
        print('Processing ${entity.path}...');
        _processDartFile(entity);
      }
    }
    if (stringResult.isNotEmpty) {
      final outputMap = <String, String>{};
      for (var value in stringResult) {
        if (outputMap.containsValue(value)) {
          continue;
        }
        final key = UuidV4().generate();
        outputMap[key] = value;
      }
      // output to json
      final j = json.encode(outputMap);
      File("./lib/generated/l10n_temp.json").writeAsStringSync(j);
      print(
          "output to json file (length: ${outputMap.length}): ./lib/generated/l10n_temp.json");
    }
  }

  void replaceL10nFiles() {
    final l10nFile = File("./lib/l10n/intl_zh_CN.arb");
    // readToJsonMap
    final jsonMap = json.decode(l10nFile.readAsStringSync());
    // read all dart File
    final dir = Directory('lib/ui');
    for (var entity in dir.listSync(recursive: true)) {
      if (entity is File && entity.path.endsWith('.dart')) {
        print('Processing ${entity.path}...');
        _replaceDartFile(entity, jsonMap);
      }
    }
  }

  void _processDartFile(File file) {
    final parseResult = parseFile(
        path: file.path, featureSet: FeatureSet.latestLanguageVersion());
    final unit = parseResult.unit;
    unit.accept(MyAstVisitor());
  }

  void _replaceDartFile(File entity, jsonMap) {
    final parseResult = parseFile(
        path: entity.path, featureSet: FeatureSet.latestLanguageVersion());
    final unit = parseResult.unit;
    final visitor = ReplaceAstVisitor(jsonMap);
    unit.accept(visitor);
    final output = visitor.buffer.toString();
    entity.writeAsStringSync(output);
  }
}

class ReplaceAstVisitor extends GeneralizingAstVisitor {
  final Map<String, String> jsonMap;
  final buffer = StringBuffer();

  ReplaceAstVisitor(this.jsonMap);

  @override
  visitSimpleStringLiteral(SimpleStringLiteral node) {
    final value = node.value;
    if (jsonMap.containsValue(value)) {
      final key = jsonMap.keys.firstWhere((k) => jsonMap[k] == value);
      buffer.write('S.current.$key');
    } else {
      buffer.write(value);
    }
    return super.visitSimpleStringLiteral(node);
  }

}

class MyAstVisitor extends GeneralizingAstVisitor {
  @override
  visitStringLiteral(StringLiteral node) {
    final value = node.stringValue ?? "";
    if (containsChinese(value)) {
      print('Found->visitStringLiteral: $value');
      addStringResult(value);
    }
    return super.visitStringLiteral(node);
  }

  @override
  visitAdjacentStrings(AdjacentStrings node) {
    int interpolationIndex = 0;
    var result = '';
    for (var string in node.strings) {
      if (string is SimpleStringLiteral) {
        result += string.value;
      } else if (string is StringInterpolation) {
        for (var element in string.elements) {
          if (element is InterpolationString) {
            result += element.value;
          } else if (element is InterpolationExpression) {
            result += '{{v${interpolationIndex++}}}';
          }
        }
      }
    }
    if (containsChinese(result)) {
      print('Found->visitAdjacentStrings: $result');
      addStringResult(result);
    }
    return super.visitAdjacentStrings(node);
  }

  @override
  visitStringInterpolation(StringInterpolation node) {
    int interpolationIndex = 0;
    var result = '';
    for (var element in node.elements) {
      if (element is InterpolationString) {
        result += element.value;
      } else if (element is InterpolationExpression) {
        result += '{{v${interpolationIndex++}}}';
      }
    }
    if (containsChinese(result)) {
      print('Found->visitStringInterpolation: $result');
      addStringResult(result);
    }
    return super.visitStringInterpolation(node);
  }

  @override
  visitInterpolationExpression(InterpolationExpression node) {
    int interpolationIndex = 0;
    final value = '{{v${interpolationIndex++}}}';
    if (containsChinese(value)) {
      print('Found->visitInterpolationExpression: $value');
      addStringResult(value);
    }
    return super.visitInterpolationExpression(node);
  }

  bool containsChinese(String input) {
    return RegExp(r'[\u4e00-\u9fa5]').hasMatch(input);
  }

  addStringResult(String value) {
    stringResult.add(value);
  }
}
