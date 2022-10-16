// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class AppSettingsCollectionReference
    implements
        AppSettingsQuery,
        FirestoreCollectionReference<AppSettings, AppSettingsQuerySnapshot> {
  factory AppSettingsCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$AppSettingsCollectionReference;

  static AppSettings fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return AppSettings.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    AppSettings value,
    SetOptions? options,
  ) {
    return _$AppSettingsToJson(value);
  }

  @override
  CollectionReference<AppSettings> get reference;

  @override
  AppSettingsDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<AppSettingsDocumentReference> add(AppSettings value);
}

class _$AppSettingsCollectionReference extends _$AppSettingsQuery
    implements AppSettingsCollectionReference {
  factory _$AppSettingsCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$AppSettingsCollectionReference._(
      firestore.collection('AppSettings').withConverter(
            fromFirestore: AppSettingsCollectionReference.fromFirestore,
            toFirestore: AppSettingsCollectionReference.toFirestore,
          ),
    );
  }

  _$AppSettingsCollectionReference._(
    CollectionReference<AppSettings> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<AppSettings> get reference =>
      super.reference as CollectionReference<AppSettings>;

  @override
  AppSettingsDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return AppSettingsDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<AppSettingsDocumentReference> add(AppSettings value) {
    return reference
        .add(value)
        .then((ref) => AppSettingsDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$AppSettingsCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class AppSettingsDocumentReference extends FirestoreDocumentReference<
    AppSettings, AppSettingsDocumentSnapshot> {
  factory AppSettingsDocumentReference(
          DocumentReference<AppSettings> reference) =
      _$AppSettingsDocumentReference;

  DocumentReference<AppSettings> get reference;

  /// A reference to the [AppSettingsCollectionReference] containing this document.
  AppSettingsCollectionReference get parent {
    return _$AppSettingsCollectionReference(reference.firestore);
  }

  @override
  Stream<AppSettingsDocumentSnapshot> snapshots();

  @override
  Future<AppSettingsDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    int searchInKm,
    DateTime updatedAt,
  });

  Future<void> set(AppSettings value);
}

class _$AppSettingsDocumentReference
    extends FirestoreDocumentReference<AppSettings, AppSettingsDocumentSnapshot>
    implements AppSettingsDocumentReference {
  _$AppSettingsDocumentReference(this.reference);

  @override
  final DocumentReference<AppSettings> reference;

  /// A reference to the [AppSettingsCollectionReference] containing this document.
  AppSettingsCollectionReference get parent {
    return _$AppSettingsCollectionReference(reference.firestore);
  }

  @override
  Stream<AppSettingsDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return AppSettingsDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<AppSettingsDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return AppSettingsDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? searchInKm = _sentinel,
    Object? updatedAt = _sentinel,
  }) async {
    final json = {
      if (searchInKm != _sentinel) "searchInKm": searchInKm as int,
      if (updatedAt != _sentinel) "updatedAt": updatedAt as DateTime,
    };

    return reference.update(json);
  }

  Future<void> set(AppSettings value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is AppSettingsDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class AppSettingsDocumentSnapshot
    extends FirestoreDocumentSnapshot<AppSettings> {
  AppSettingsDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<AppSettings> snapshot;

  @override
  AppSettingsDocumentReference get reference {
    return AppSettingsDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final AppSettings? data;
}

abstract class AppSettingsQuery
    implements QueryReference<AppSettings, AppSettingsQuerySnapshot> {
  @override
  AppSettingsQuery limit(int limit);

  @override
  AppSettingsQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  AppSettingsQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  AppSettingsQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  AppSettingsQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  AppSettingsQuery whereSearchInKm({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  AppSettingsQuery whereUpdatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  });

  AppSettingsQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  });

  AppSettingsQuery orderBySearchInKm({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  });

  AppSettingsQuery orderByUpdatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  });
}

class _$AppSettingsQuery
    extends QueryReference<AppSettings, AppSettingsQuerySnapshot>
    implements AppSettingsQuery {
  _$AppSettingsQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<AppSettings> reference;

  AppSettingsQuerySnapshot _decodeSnapshot(
    QuerySnapshot<AppSettings> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return AppSettingsQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<AppSettingsDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: AppSettingsDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return AppSettingsQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<AppSettingsQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<AppSettingsQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  AppSettingsQuery limit(int limit) {
    return _$AppSettingsQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  AppSettingsQuery limitToLast(int limit) {
    return _$AppSettingsQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  AppSettingsQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(fieldPath, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$AppSettingsQuery(query, _collection);
  }

  AppSettingsQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$AppSettingsQuery(
      reference.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      _collection,
    );
  }

  AppSettingsQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$AppSettingsQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  AppSettingsQuery whereSearchInKm({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$AppSettingsQuery(
      reference.where(
        _$AppSettingsFieldMap["searchInKm"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  AppSettingsQuery whereUpdatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  }) {
    return _$AppSettingsQuery(
      reference.where(
        _$AppSettingsFieldMap["updatedAt"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  AppSettingsQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$AppSettingsQuery(query, _collection);
  }

  AppSettingsQuery orderBySearchInKm({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$AppSettingsFieldMap["searchInKm"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$AppSettingsQuery(query, _collection);
  }

  AppSettingsQuery orderByUpdatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppSettingsDocumentSnapshot? startAtDocument,
    AppSettingsDocumentSnapshot? endAtDocument,
    AppSettingsDocumentSnapshot? endBeforeDocument,
    AppSettingsDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$AppSettingsFieldMap["updatedAt"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$AppSettingsQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$AppSettingsQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class AppSettingsQuerySnapshot extends FirestoreQuerySnapshot<AppSettings,
    AppSettingsQueryDocumentSnapshot> {
  AppSettingsQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<AppSettings> snapshot;

  @override
  final List<AppSettingsQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<AppSettingsDocumentSnapshot>> docChanges;
}

class AppSettingsQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<AppSettings>
    implements AppSettingsDocumentSnapshot {
  AppSettingsQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<AppSettings> snapshot;

  @override
  AppSettingsDocumentReference get reference {
    return AppSettingsDocumentReference(snapshot.reference);
  }

  @override
  final AppSettings data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => AppSettings(
      foodTags: (json['foodTags'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList() ??
          const [],
      searchInKm: json['searchInKm'] as int? ?? 30,
      updatedAt: const DateTimeToTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

const _$AppSettingsFieldMap = <String, String>{
  'foodTags': 'foodTags',
  'searchInKm': 'searchInKm',
  'updatedAt': 'updatedAt',
};

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{
      'foodTags': instance.foodTags,
      'searchInKm': instance.searchInKm,
      'updatedAt':
          const DateTimeToTimestampConverter().toJson(instance.updatedAt),
    };
