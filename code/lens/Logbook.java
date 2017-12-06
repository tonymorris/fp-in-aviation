import java.util.function.Function;
import java.util.function.Predicate;

final class Pair<A, B> {
  final A a;
  final B b;

  Pair(final A a, final B b) {
    this.a = a;
    this.b = b;
  }
}

// package no.really.immutable.not.pretend;
final class List<A> {
  Pair<List<A>, List<A>> unspan(final Predicate<A> p) {
    return null; // todo
  }

  List<A> append(final List<A> y) {
    return null; // todo
  }

  boolean isEmpty() {
    return false; // todo
  }

  List<A> cons(final A a) {
    return null; // todo
  }

  A head() {
    return null; // todo
  }

  List<A> tail() {
    return null; // todo
  }
}

class LogbookEntry {
  // todo
}

final class Logbook {
  final Aviator aviator;
  final List<LogbookEntry> entries;

  Logbook(final Aviator aviator, final List<LogbookEntry> entries) {
    this.aviator = aviator;
    this.entries = entries;
  }
}

final class Aviator {
  final String surname;
  final String firstname;
  final ARN arn;

  Aviator(final String surname, final String firstname, final ARN arn) {
    this.surname = surname;
    this.firstname = firstname;
    this.arn = arn;
  }
}

final class ARN {
  final List<Digit> digits;

  ARN(final List<Digit> digits) {
    this.digits = digits;
  }
}

enum Digit {
    _0
  , _1
  , _2
  , _3
  , _4
  , _5
  , _6
  , _7
  , _8
  , _9;

  boolean isEven() {
    return false; // todo
  }
  
  Digit add() {
    return null; // todo
  }
}

// take the Logbook's Aviator's ARN's first digit that is even (if there is one that is even), and add 1

class LogbookFunctions {
  Logbook application(final Logbook b) {
    final Pair<List<Digit>, List<Digit>> d = b.aviator.arn.digits.unspan(v -> v.isEven());
    final List<Digit> da = d.a;
    final List<Digit> db = d.b;
    if(db.isEmpty()) {
      return b;
    } else {
      return
        new Logbook(
          new Aviator(b.aviator.surname, b.aviator.firstname,
            new ARN(da.append(db.tail().cons(db.head().add())))), b.entries);
    }
  }
}
