// Copyright (c) 2017, dis. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:html';
import 'dart:math';

Map<Symbol, Function> _symbolToValue = {
  #test01 : (dynamic o)=> o.test01,
  #test02 : (dynamic o)=> o.test02,
  #test03 : (dynamic o)=> o.test03,
  #test04 : (dynamic o)=> o.test04,
  #test05 : (dynamic o)=> o.test05,
  #test06 : (dynamic o)=> o.test06,
  #test07 : (dynamic o)=> o.test07,
  #test08 : (dynamic o)=> o.test08,
  #test09 : (dynamic o)=> o.test09,
  #test10 : (dynamic o)=> o.test10,

  #test11 : (dynamic o)=> o.test11,
  #test12 : (dynamic o)=> o.test12,
  #test13 : (dynamic o)=> o.test13,
  #test14 : (dynamic o)=> o.test14,
  #test15 : (dynamic o)=> o.test15,
  #test16 : (dynamic o)=> o.test16,
  #test17 : (dynamic o)=> o.test17,
  #test18 : (dynamic o)=> o.test18,
  #test19 : (dynamic o)=> o.test19,
  #test20 : (dynamic o)=> o.test20,

  #test21 : (dynamic o)=> o.test21,
  #test22 : (dynamic o)=> o.test22,
  #test23 : (dynamic o)=> o.test23,
  #test24 : (dynamic o)=> o.test24,
  #test25 : (dynamic o)=> o.test25,
  #test26 : (dynamic o)=> o.test26,
  #test27 : (dynamic o)=> o.test27,
  #test28 : (dynamic o)=> o.test28,
  #test29 : (dynamic o)=> o.test29,
  #test30 : (dynamic o)=> o.test30
};

Map<String, Function> _stringToValue = {
  'test01' : (dynamic o)=> o.test01,
  'test02' : (dynamic o)=> o.test02,
  'test03' : (dynamic o)=> o.test03,
  'test04' : (dynamic o)=> o.test04,
  'test05' : (dynamic o)=> o.test05,
  'test06' : (dynamic o)=> o.test06,
  'test07' : (dynamic o)=> o.test07,
  'test08' : (dynamic o)=> o.test08,
  'test09' : (dynamic o)=> o.test09,
  'test10' : (dynamic o)=> o.test10,

  'test11' : (dynamic o)=> o.test11,
  'test12' : (dynamic o)=> o.test12,
  'test13' : (dynamic o)=> o.test13,
  'test14' : (dynamic o)=> o.test14,
  'test15' : (dynamic o)=> o.test15,
  'test16' : (dynamic o)=> o.test16,
  'test17' : (dynamic o)=> o.test17,
  'test18' : (dynamic o)=> o.test18,
  'test19' : (dynamic o)=> o.test19,
  'test20' : (dynamic o)=> o.test20,

  'test21' : (dynamic o)=> o.test21,
  'test22' : (dynamic o)=> o.test22,
  'test23' : (dynamic o)=> o.test23,
  'test24' : (dynamic o)=> o.test24,
  'test25' : (dynamic o)=> o.test25,
  'test26' : (dynamic o)=> o.test26,
  'test27' : (dynamic o)=> o.test27,
  'test28' : (dynamic o)=> o.test28,
  'test29' : (dynamic o)=> o.test29,
  'test30' : (dynamic o)=> o.test30
};

const int testCount = 10;
const int testAccessCount = 1000000;
//const Symbol _valueSym1 = #test01;
//const Symbol _valueSym2 = #test02;
//const String _valueStr1 = 'test01';
//const String _valueStr2 = 'test02';

List<Symbol> symbols = [];
List<String> strings = [];


testSymbolAccess(TestObject1 testObject1, StringBuffer sb) async {
  Stopwatch work = new Stopwatch();
  int sumTime = 0;
  int minTime = 99999999999;
  int maxTime = 0;
  var sum = 0;
  for (var i = 0; i < testCount; i++) {
    work..reset()..start();

    // TEST body --------
    symbols.forEach((item){
      sum+=_symbolToValue[item](testObject1);
    });
    // TEST body -------


    var iterationTime =work.elapsedMilliseconds;
    sumTime += iterationTime;
    if (minTime> iterationTime){
      minTime = iterationTime;
    }
    if (maxTime< iterationTime){
      maxTime = iterationTime;
    }
    var folderCountMessage = "time: ${iterationTime} ms ";
    work.stop();
    sb.writeln(folderCountMessage);
  }
  num avgTime = sumTime / testCount;
  sb.writeln("Symbol, Count: ${testCount} , maxTime: ${maxTime} minTime: ${minTime} avgTime: ${avgTime} testSum:${sum}");
  sb.writeln("----");
}

testStringAccess(TestObject1 testObject1, StringBuffer sb) async {
  Stopwatch work = new Stopwatch();
  int sumTime = 0;
  int minTime = 99999999999;
  int maxTime = 0;
  var sum = 0;
  for (var i = 0; i < testCount; i++) {
    work..reset()..start();

    // TEST body --------
    strings.forEach((item){
      sum+=_stringToValue[item](testObject1);
    });
    // TEST body -------


    var iterationTime =work.elapsedMilliseconds;
    sumTime += iterationTime;
    if (minTime> iterationTime){
      minTime = iterationTime;
    }
    if (maxTime< iterationTime){
      maxTime = iterationTime;
    }
    var folderCountMessage = "time: ${iterationTime} ms ";
    work.stop();
    sb.writeln(folderCountMessage);
  }
  num avgTime = sumTime / testCount;
  sb.writeln("String, Count: ${testCount} , maxTime: ${maxTime} minTime: ${minTime} avgTime: ${avgTime} testSum:${sum}");
  sb.writeln("----");
}

testSwitchAccess(TestObject1 testObject1, StringBuffer sb) async {
  Stopwatch work = new Stopwatch();
  int sumTime = 0;
  int minTime = 99999999999;
  int maxTime = 0;
  var sum = 0;
  for (var i = 0; i < testCount; i++) {
    work
      ..reset()
      ..start();

    // TEST body --------
    strings.forEach((item) {
      sum += testObject1.getValue<int>(item);
    });
    // TEST body -------


    var iterationTime = work.elapsedMilliseconds;
    sumTime += iterationTime;
    if (minTime > iterationTime) {
      minTime = iterationTime;
    }
    if (maxTime < iterationTime) {
      maxTime = iterationTime;
    }
    var folderCountMessage = "time: ${iterationTime} ms";
    work.stop();
    sb.writeln(folderCountMessage);
  }
  num avgTime = sumTime / testCount;
  sb.writeln(
      "Switch, Count: ${testCount} , maxTime: ${maxTime} minTime: ${minTime} avgTime: ${avgTime} testSum:${sum}");
  sb.writeln("----");
}

class TestObject1{
  int test01 = 1;
  int test02 = 2;
  int test03 = 3;
  int test04 = 4;
  int test05 = 5;
  int test06 = 6;
  int test07 = 7;
  int test08 = 8;
  int test09 = 9;
  int test10 = 10;

  int test11 = 1;
  int test12 = 2;
  int test13 = 3;
  int test14 = 4;
  int test15 = 5;
  int test16 = 6;
  int test17 = 7;
  int test18 = 8;
  int test19 = 9;
  int test20 = 10;

  int test21 = 1;
  int test22 = 2;
  int test23 = 3;
  int test24 = 4;
  int test25 = 5;
  int test26 = 6;
  int test27 = 7;
  int test28 = 8;
  int test29 = 9;
  int test30 = 10;

  TestObject1(this.test01, this.test02);
  getValue<T>(String fieldName){
    switch (fieldName){
      case 'test01': return test01;
      case 'test02': return test02;
      case 'test03': return test03;
      case 'test04': return test04;
      case 'test05': return test05;
      case 'test06': return test06;
      case 'test07': return test07;
      case 'test08': return test08;
      case 'test09': return test09;
      case 'test10': return test10;

      case 'test11': return test11;
      case 'test12': return test12;
      case 'test13': return test13;
      case 'test14': return test14;
      case 'test15': return test15;
      case 'test16': return test16;
      case 'test17': return test17;
      case 'test18': return test18;
      case 'test19': return test19;
      case 'test20': return test20;

      case 'test21': return test21;
      case 'test22': return test22;
      case 'test23': return test23;
      case 'test24': return test24;
      case 'test25': return test25;
      case 'test26': return test26;
      case 'test27': return test27;
      case 'test28': return test28;
      case 'test29': return test29;
      case 'test30': return test20;
    }
  }
}


main() async{
  Random rnd = new Random.secure();
  final int keyCount = _symbolToValue.keys.length;
  for (var i = 0; i < testAccessCount; i++) {
    var index = rnd.nextInt(keyCount);
    symbols.add(_symbolToValue.keys.elementAt(index));
    strings.add(_stringToValue.keys.elementAt(index));
  }
  StringBuffer _output = new StringBuffer();
  _output.writeln('keyCount: ${keyCount} testAccessCount: ${testAccessCount} testCount: ${testCount}');
  _output.writeln('-----------');
  var testObject1 = new TestObject1(rnd.nextInt(5), rnd.nextInt(5));
  await showText('Symbol running...');
  await testSymbolAccess(testObject1, _output);
  await showText('String running...');
  await testStringAccess(testObject1, _output);
  await showText('Switch running...');
  await testSwitchAccess(testObject1, _output);
  await showText(_output.toString());
}

showText(String str) async{
  print(str);
  document.getElementById('output').innerHtml = str.replaceAll('\n', '</br>');
  return new Future.delayed(new Duration(milliseconds: 10));
}