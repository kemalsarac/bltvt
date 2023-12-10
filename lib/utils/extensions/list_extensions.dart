import 'dart:async';
import '../culture_format.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart' as collection;
import 'package:decimal/decimal.dart';

extension FuturisticListExtensions<T> on Future<List<T>> {
  void forEachItem(void Function(T element) f) async {
    for (T element in await this) {
      f(element);
    }
  }

  void forEachAsync(Future Function(T element) f) async {
    for (T element in await this) {
      await f(element);
    }
  }

  Future<List<T>> where(bool Function(T) condition) async {
    return (await this).where(condition).toList();
  }

  Future<List<T>> whereAsync(Future<bool> Function(T) condition) async {
    return (await this).whereAsync(condition);
  }

  Future<T> firstWhereAsync(Future<bool> Function(T) condition) async {
    var result = (await (await this).whereAsync(condition));
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<K, List<T>>> groupBy<K>(K Function(T) predicate) async {
    return (await this).groupBy(predicate);
  }

  Future<Map<K, List<T>>> groupByAsync<K>(Future<K> Function(T) predicate) async {
    return (await this).groupByAsync(predicate);
  }

  Future<List<K>> map<K>(K Function(T e) f) async {
    return (await this).map(f).toList();
  }

  Future<List<K>> mapAsync<K>(Future<K> Function(T e) f) async {
    return Future.wait((await this).map(f).toList());
  }

  Future<bool> hasAny(bool Function(T) condition) async {
    return (await this).any(condition);
  }

  Future<bool> anyAsync(Future<bool> Function(T) condition) async {
    return (await this).anyAsync(condition);
  }

  Future<bool> everyAsync(Future<bool> Function(T) condition) async {
    var result = true;
    for (var item in await this) {
      result = await condition(item);
      if (!result) {
        break;
      }
    }
    return result;
  }

  Future<void> removeWhereAsync(Future<bool> Function(T item) condition) async {
    return (await this).removeWhereAsync(condition);
  }

  Future<List<T>> orderDescAsync({Future<dynamic> Function(T) on, List<Future<dynamic> Function(T)> onAll}) async {
    return (await (await this).orderAsync(on: on, onAll: onAll)).reversed.toList();
  }

  Future<Decimal> sumDecimal(Future<Decimal> Function(T) f) async {
    Decimal total = Decimal.zero;
    for (var item in await this) {
      total += await f(item);
    }
    return total;
  }

  Future<num> sumNum(Future<num> Function(T) f) async {
    num total = 0;
    for (var item in await this) {
      total += await f(item);
    }
    return total;
  }
}

extension ListExtensions<T> on List<T> {
  ///Async version of Iterable.where(test)
  Future<List<T>> whereAsync(Future<bool> Function(T) condition) async {
    var resultList = <T>[];
    for (var item in this) {
      if (await condition(item)) {
        resultList.add(item);
      }
    }
    return resultList;
  }

  Future forEachAsync(Future Function(T) action) async {
    for (var item in this) {
      await action(item);
    }
  }

  Future<bool> anyAsync(Future<bool> Function(T) condition) async {
    var result = false;
    for (var item in this) {
      if (await condition(item)) {
        result = true;
        break;
      }
    }
    return result;
  }

  Future<List<K>> expandAsync<K>(Future<List<K>> Function(T) f) async {
    var result = <K>[];
    for (var item in this) {
      result.addAll(await f(item));
    }
    return result;
  }

  Future<void> removeWhereAsync(Future<bool> Function(T item) condition) async {
    var removeList = <T>[];
    for (var item in this) {
      if (await condition(item)) {
        removeList.add(item);
      }
    }
    for (var item in removeList) {
      remove(item);
    }
  }

  ///Author Mert Köküşen
  ///Üretim yeri Bostancı Sanayi Sitesi
  ///Daha iyi bir çözüm bulana kadar böyle verimsiz bir yöntemle idare edeceğiz.
  Future<List<T>> orderAsync<K extends Comparable>(
      {Future<dynamic> Function(T) on, List<Future<dynamic> Function(T)> onAll}) async {
    Map<dynamic, T> map = {for (var i in this) await on(i): i};

    var keys = map.keys;

    if (keys.isEmpty) {
      return this;
    }

    keys.toList().sort();

    return keys.map((i) => map[i]).toList();
  }

  Future<List<T>> orderAsync2<K extends Comparable>(
      {Future<dynamic> Function(T) on, List<Future<dynamic> Function(T)> onAll}) async {
    Map<Future<dynamic>, T> map = {for (var i in this) await on(i): i};

    await Future.wait(map.keys);

    var keys = map.keys;

    if (keys.isEmpty) {
      return this;
    }

    keys.toList().sort();

    return keys.map((i) => map[i]).toList();
  }

  Map<K, List<T>> groupBy<K>(K Function(T) predicate) {
    return collection.groupBy(this, predicate);
  }

  Future<Map<K, List<T>>> groupByAsync<K>(Future<K> Function(T element) key) async {
    var map = <K, List<T>>{};
    for (var element in this) {
      var list = map.putIfAbsent(await key(element), () => []);
      list.add(element);
    }
    return map;
  }

  Future<Decimal> sumDecimalAsync(Future<Decimal> Function(T) f) async {
    Decimal total = Decimal.zero;
    for (var item in this) {
      total += await f(item);
    }
    return total;
  }

  Decimal sumDecimal(Decimal Function(T) f) {
    Decimal total = Decimal.zero;
    for (var item in this) {
      total += f(item);
    }
    return total;
  }

  num sumNum(num Function(T) f) {
    num total = 0;
    for (var item in this) {
      total += f(item);
    }
    return total;
  }

  String sumStringMoney(String Function(T) f) {
    num total = 0;
    for (var item in this) {
      total += double.parse(f(item).replaceAll(".", "").replaceAll(",", "."));
    }
    return moneyFormat(total);
  }

  Future<num> sumNumAsync(Future<num> Function(T) f) async {
    num total = 0;
    for (var item in this) {
      total += await f(item);
    }
    return total;
  }

  String toSqlIn() {
    return join(",");
  }
}

extension NumList on List<num> {
  num sum() {
    return fold(0, (p, c) => p + c);
  }
}

extension DecimalList on List<Decimal> {
  Decimal sum() {
    return fold(Decimal.zero, (p, c) => p + c);
  }
}
