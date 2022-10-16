// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_category.dart';

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
abstract class FoodCategoryCollectionReference
    implements
        FoodCategoryQuery,
        FirestoreCollectionReference<FoodCategory, FoodCategoryQuerySnapshot> {
  factory FoodCategoryCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$FoodCategoryCollectionReference;

  static FoodCategory fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return FoodCategory.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    FoodCategory value,
    SetOptions? options,
  ) {
    return _$FoodCategoryToJson(value);
  }

  @override
  CollectionReference<FoodCategory> get reference;

  @override
  FoodCategoryDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<FoodCategoryDocumentReference> add(FoodCategory value);
}

class _$FoodCategoryCollectionReference extends _$FoodCategoryQuery
    implements FoodCategoryCollectionReference {
  factory _$FoodCategoryCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$FoodCategoryCollectionReference._(
      firestore.collection('FoodCategory').withConverter(
            fromFirestore: FoodCategoryCollectionReference.fromFirestore,
            toFirestore: FoodCategoryCollectionReference.toFirestore,
          ),
    );
  }

  _$FoodCategoryCollectionReference._(
    CollectionReference<FoodCategory> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<FoodCategory> get reference =>
      super.reference as CollectionReference<FoodCategory>;

  @override
  FoodCategoryDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return FoodCategoryDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<FoodCategoryDocumentReference> add(FoodCategory value) {
    return reference
        .add(value)
        .then((ref) => FoodCategoryDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$FoodCategoryCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class FoodCategoryDocumentReference extends FirestoreDocumentReference<
    FoodCategory, FoodCategoryDocumentSnapshot> {
  factory FoodCategoryDocumentReference(
          DocumentReference<FoodCategory> reference) =
      _$FoodCategoryDocumentReference;

  DocumentReference<FoodCategory> get reference;

  /// A reference to the [FoodCategoryCollectionReference] containing this document.
  FoodCategoryCollectionReference get parent {
    return _$FoodCategoryCollectionReference(reference.firestore);
  }

  @override
  Stream<FoodCategoryDocumentSnapshot> snapshots();

  @override
  Future<FoodCategoryDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String resturantOwnerId,
    String name,
    bool active,
    int totalFoodItems,
    DateTime? createdAt,
    DateTime updatedAt,
  });

  Future<void> set(FoodCategory value);
}

class _$FoodCategoryDocumentReference extends FirestoreDocumentReference<
    FoodCategory,
    FoodCategoryDocumentSnapshot> implements FoodCategoryDocumentReference {
  _$FoodCategoryDocumentReference(this.reference);

  @override
  final DocumentReference<FoodCategory> reference;

  /// A reference to the [FoodCategoryCollectionReference] containing this document.
  FoodCategoryCollectionReference get parent {
    return _$FoodCategoryCollectionReference(reference.firestore);
  }

  @override
  Stream<FoodCategoryDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return FoodCategoryDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<FoodCategoryDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return FoodCategoryDocumentSnapshot._(
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
    Object? resturantOwnerId = _sentinel,
    Object? name = _sentinel,
    Object? active = _sentinel,
    Object? totalFoodItems = _sentinel,
    Object? createdAt = _sentinel,
    Object? updatedAt = _sentinel,
  }) async {
    final json = {
      if (resturantOwnerId != _sentinel)
        "resturantOwnerId": resturantOwnerId as String,
      if (name != _sentinel) "name": name as String,
      if (active != _sentinel) "active": active as bool,
      if (totalFoodItems != _sentinel) "totalFoodItems": totalFoodItems as int,
      if (createdAt != _sentinel) "createdAt": createdAt as DateTime?,
      if (updatedAt != _sentinel) "updatedAt": updatedAt as DateTime,
    };

    return reference.update(json);
  }

  Future<void> set(FoodCategory value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is FoodCategoryDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class FoodCategoryDocumentSnapshot
    extends FirestoreDocumentSnapshot<FoodCategory> {
  FoodCategoryDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<FoodCategory> snapshot;

  @override
  FoodCategoryDocumentReference get reference {
    return FoodCategoryDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final FoodCategory? data;
}

abstract class FoodCategoryQuery
    implements QueryReference<FoodCategory, FoodCategoryQuerySnapshot> {
  @override
  FoodCategoryQuery limit(int limit);

  @override
  FoodCategoryQuery limitToLast(int limit);

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
  FoodCategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
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
  FoodCategoryQuery whereFieldPath(
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

  FoodCategoryQuery whereDocumentId({
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
  FoodCategoryQuery whereResturantOwnerId({
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
  FoodCategoryQuery whereName({
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
  FoodCategoryQuery whereActive({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  FoodCategoryQuery whereTotalFoodItems({
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
  FoodCategoryQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  FoodCategoryQuery whereUpdatedAt({
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

  FoodCategoryQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
  });

  FoodCategoryQuery orderByResturantOwnerId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
  });

  FoodCategoryQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
  });

  FoodCategoryQuery orderByActive({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
  });

  FoodCategoryQuery orderByTotalFoodItems({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
  });

  FoodCategoryQuery orderByCreatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
  });

  FoodCategoryQuery orderByUpdatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
  });
}

class _$FoodCategoryQuery
    extends QueryReference<FoodCategory, FoodCategoryQuerySnapshot>
    implements FoodCategoryQuery {
  _$FoodCategoryQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<FoodCategory> reference;

  FoodCategoryQuerySnapshot _decodeSnapshot(
    QuerySnapshot<FoodCategory> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return FoodCategoryQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<FoodCategoryDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: FoodCategoryDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return FoodCategoryQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<FoodCategoryQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<FoodCategoryQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  FoodCategoryQuery limit(int limit) {
    return _$FoodCategoryQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  FoodCategoryQuery limitToLast(int limit) {
    return _$FoodCategoryQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  FoodCategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
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

    return _$FoodCategoryQuery(query, _collection);
  }

  FoodCategoryQuery whereFieldPath(
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
    return _$FoodCategoryQuery(
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

  FoodCategoryQuery whereDocumentId({
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
    return _$FoodCategoryQuery(
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

  FoodCategoryQuery whereResturantOwnerId({
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
    return _$FoodCategoryQuery(
      reference.where(
        _$FoodCategoryFieldMap["resturantOwnerId"]!,
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

  FoodCategoryQuery whereName({
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
    return _$FoodCategoryQuery(
      reference.where(
        _$FoodCategoryFieldMap["name"]!,
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

  FoodCategoryQuery whereActive({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$FoodCategoryQuery(
      reference.where(
        _$FoodCategoryFieldMap["active"]!,
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

  FoodCategoryQuery whereTotalFoodItems({
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
    return _$FoodCategoryQuery(
      reference.where(
        _$FoodCategoryFieldMap["totalFoodItems"]!,
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

  FoodCategoryQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$FoodCategoryQuery(
      reference.where(
        _$FoodCategoryFieldMap["createdAt"]!,
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

  FoodCategoryQuery whereUpdatedAt({
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
    return _$FoodCategoryQuery(
      reference.where(
        _$FoodCategoryFieldMap["updatedAt"]!,
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

  FoodCategoryQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
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

    return _$FoodCategoryQuery(query, _collection);
  }

  FoodCategoryQuery orderByResturantOwnerId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodCategoryFieldMap["resturantOwnerId"]!,
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

    return _$FoodCategoryQuery(query, _collection);
  }

  FoodCategoryQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodCategoryFieldMap["name"]!,
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

    return _$FoodCategoryQuery(query, _collection);
  }

  FoodCategoryQuery orderByActive({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodCategoryFieldMap["active"]!,
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

    return _$FoodCategoryQuery(query, _collection);
  }

  FoodCategoryQuery orderByTotalFoodItems({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodCategoryFieldMap["totalFoodItems"]!,
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

    return _$FoodCategoryQuery(query, _collection);
  }

  FoodCategoryQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodCategoryFieldMap["createdAt"]!,
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

    return _$FoodCategoryQuery(query, _collection);
  }

  FoodCategoryQuery orderByUpdatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodCategoryDocumentSnapshot? startAtDocument,
    FoodCategoryDocumentSnapshot? endAtDocument,
    FoodCategoryDocumentSnapshot? endBeforeDocument,
    FoodCategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodCategoryFieldMap["updatedAt"]!,
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

    return _$FoodCategoryQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$FoodCategoryQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class FoodCategoryQuerySnapshot extends FirestoreQuerySnapshot<FoodCategory,
    FoodCategoryQueryDocumentSnapshot> {
  FoodCategoryQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<FoodCategory> snapshot;

  @override
  final List<FoodCategoryQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<FoodCategoryDocumentSnapshot>> docChanges;
}

class FoodCategoryQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<FoodCategory>
    implements FoodCategoryDocumentSnapshot {
  FoodCategoryQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<FoodCategory> snapshot;

  @override
  FoodCategoryDocumentReference get reference {
    return FoodCategoryDocumentReference(snapshot.reference);
  }

  @override
  final FoodCategory data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodCategory _$FoodCategoryFromJson(Map<String, dynamic> json) => FoodCategory(
      resturantOwnerId: json['resturantOwnerId'] as String,
      name: json['name'] as String,
      totalFoodItems: json['totalFoodItems'] as int? ?? 0,
      active: json['active'] as bool? ?? true,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeToTimestampConverter().fromJson),
      updatedAt: const DateTimeToTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

const _$FoodCategoryFieldMap = <String, String>{
  'resturantOwnerId': 'resturantOwnerId',
  'name': 'name',
  'active': 'active',
  'totalFoodItems': 'totalFoodItems',
  'createdAt': 'createdAt',
  'updatedAt': 'updatedAt',
};

Map<String, dynamic> _$FoodCategoryToJson(FoodCategory instance) =>
    <String, dynamic>{
      'resturantOwnerId': instance.resturantOwnerId,
      'name': instance.name,
      'active': instance.active,
      'totalFoodItems': instance.totalFoodItems,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeToTimestampConverter().toJson),
      'updatedAt':
          const DateTimeToTimestampConverter().toJson(instance.updatedAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
