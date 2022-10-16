// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item.dart';

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
abstract class FoodItemCollectionReference
    implements
        FoodItemQuery,
        FirestoreCollectionReference<FoodItem, FoodItemQuerySnapshot> {
  factory FoodItemCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$FoodItemCollectionReference;

  static FoodItem fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return FoodItem.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    FoodItem value,
    SetOptions? options,
  ) {
    return _$FoodItemToJson(value);
  }

  @override
  CollectionReference<FoodItem> get reference;

  @override
  FoodItemDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<FoodItemDocumentReference> add(FoodItem value);
}

class _$FoodItemCollectionReference extends _$FoodItemQuery
    implements FoodItemCollectionReference {
  factory _$FoodItemCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$FoodItemCollectionReference._(
      firestore.collection('FoodItems').withConverter(
            fromFirestore: FoodItemCollectionReference.fromFirestore,
            toFirestore: FoodItemCollectionReference.toFirestore,
          ),
    );
  }

  _$FoodItemCollectionReference._(
    CollectionReference<FoodItem> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<FoodItem> get reference =>
      super.reference as CollectionReference<FoodItem>;

  @override
  FoodItemDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return FoodItemDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<FoodItemDocumentReference> add(FoodItem value) {
    return reference.add(value).then((ref) => FoodItemDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$FoodItemCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class FoodItemDocumentReference
    extends FirestoreDocumentReference<FoodItem, FoodItemDocumentSnapshot> {
  factory FoodItemDocumentReference(DocumentReference<FoodItem> reference) =
      _$FoodItemDocumentReference;

  DocumentReference<FoodItem> get reference;

  /// A reference to the [FoodItemCollectionReference] containing this document.
  FoodItemCollectionReference get parent {
    return _$FoodItemCollectionReference(reference.firestore);
  }

  @override
  Stream<FoodItemDocumentSnapshot> snapshots();

  @override
  Future<FoodItemDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    String description,
    String resturantOwnerId,
    int price,
    String imageName,
    List<String> categories,
    List<String> tags,
    bool active,
    DateTime? createdAt,
    DateTime updatedAt,
    String imagePath,
  });

  Future<void> set(FoodItem value);
}

class _$FoodItemDocumentReference
    extends FirestoreDocumentReference<FoodItem, FoodItemDocumentSnapshot>
    implements FoodItemDocumentReference {
  _$FoodItemDocumentReference(this.reference);

  @override
  final DocumentReference<FoodItem> reference;

  /// A reference to the [FoodItemCollectionReference] containing this document.
  FoodItemCollectionReference get parent {
    return _$FoodItemCollectionReference(reference.firestore);
  }

  @override
  Stream<FoodItemDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return FoodItemDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<FoodItemDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return FoodItemDocumentSnapshot._(
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
    Object? name = _sentinel,
    Object? description = _sentinel,
    Object? resturantOwnerId = _sentinel,
    Object? price = _sentinel,
    Object? imageName = _sentinel,
    Object? categories = _sentinel,
    Object? tags = _sentinel,
    Object? active = _sentinel,
    Object? createdAt = _sentinel,
    Object? updatedAt = _sentinel,
    Object? imagePath = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (description != _sentinel) "description": description as String,
      if (resturantOwnerId != _sentinel)
        "resturantOwnerId": resturantOwnerId as String,
      if (price != _sentinel) "price": price as int,
      if (imageName != _sentinel) "imageName": imageName as String,
      if (categories != _sentinel) "categories": categories as List<String>,
      if (tags != _sentinel) "tags": tags as List<String>,
      if (active != _sentinel) "active": active as bool,
      if (createdAt != _sentinel) "createdAt": createdAt as DateTime?,
      if (updatedAt != _sentinel) "updatedAt": updatedAt as DateTime,
      if (imagePath != _sentinel) "imagePath": imagePath as String,
    };

    return reference.update(json);
  }

  Future<void> set(FoodItem value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is FoodItemDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class FoodItemDocumentSnapshot extends FirestoreDocumentSnapshot<FoodItem> {
  FoodItemDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<FoodItem> snapshot;

  @override
  FoodItemDocumentReference get reference {
    return FoodItemDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final FoodItem? data;
}

abstract class FoodItemQuery
    implements QueryReference<FoodItem, FoodItemQuerySnapshot> {
  @override
  FoodItemQuery limit(int limit);

  @override
  FoodItemQuery limitToLast(int limit);

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
  FoodItemQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
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
  FoodItemQuery whereFieldPath(
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

  FoodItemQuery whereDocumentId({
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
  FoodItemQuery whereName({
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
  FoodItemQuery whereDescription({
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
  FoodItemQuery whereResturantOwnerId({
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
  FoodItemQuery wherePrice({
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
  FoodItemQuery whereImageName({
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
  FoodItemQuery whereCategories({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  });
  FoodItemQuery whereTags({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  });
  FoodItemQuery whereActive({
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
  FoodItemQuery whereCreatedAt({
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
  FoodItemQuery whereUpdatedAt({
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
  FoodItemQuery whereImagePath({
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

  FoodItemQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  });

  FoodItemQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  });

  FoodItemQuery orderByDescription({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  });

  FoodItemQuery orderByResturantOwnerId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  });

  FoodItemQuery orderByPrice({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  });

  FoodItemQuery orderByImageName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  });

  FoodItemQuery orderByCategories({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  });

  FoodItemQuery orderByTags({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  });

  FoodItemQuery orderByActive({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  });

  FoodItemQuery orderByCreatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  });

  FoodItemQuery orderByUpdatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  });

  FoodItemQuery orderByImagePath({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  });
}

class _$FoodItemQuery extends QueryReference<FoodItem, FoodItemQuerySnapshot>
    implements FoodItemQuery {
  _$FoodItemQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<FoodItem> reference;

  FoodItemQuerySnapshot _decodeSnapshot(
    QuerySnapshot<FoodItem> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return FoodItemQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<FoodItemDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: FoodItemDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return FoodItemQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<FoodItemQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<FoodItemQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  FoodItemQuery limit(int limit) {
    return _$FoodItemQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  FoodItemQuery limitToLast(int limit) {
    return _$FoodItemQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  FoodItemQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
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

    return _$FoodItemQuery(query, _collection);
  }

  FoodItemQuery whereFieldPath(
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
    return _$FoodItemQuery(
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

  FoodItemQuery whereDocumentId({
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
    return _$FoodItemQuery(
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

  FoodItemQuery whereName({
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
    return _$FoodItemQuery(
      reference.where(
        _$FoodItemFieldMap["name"]!,
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

  FoodItemQuery whereDescription({
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
    return _$FoodItemQuery(
      reference.where(
        _$FoodItemFieldMap["description"]!,
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

  FoodItemQuery whereResturantOwnerId({
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
    return _$FoodItemQuery(
      reference.where(
        _$FoodItemFieldMap["resturantOwnerId"]!,
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

  FoodItemQuery wherePrice({
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
    return _$FoodItemQuery(
      reference.where(
        _$FoodItemFieldMap["price"]!,
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

  FoodItemQuery whereImageName({
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
    return _$FoodItemQuery(
      reference.where(
        _$FoodItemFieldMap["imageName"]!,
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

  FoodItemQuery whereCategories({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  }) {
    return _$FoodItemQuery(
      reference.where(
        _$FoodItemFieldMap["categories"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  FoodItemQuery whereTags({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  }) {
    return _$FoodItemQuery(
      reference.where(
        _$FoodItemFieldMap["tags"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  FoodItemQuery whereActive({
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
    return _$FoodItemQuery(
      reference.where(
        _$FoodItemFieldMap["active"]!,
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

  FoodItemQuery whereCreatedAt({
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
    return _$FoodItemQuery(
      reference.where(
        _$FoodItemFieldMap["createdAt"]!,
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

  FoodItemQuery whereUpdatedAt({
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
    return _$FoodItemQuery(
      reference.where(
        _$FoodItemFieldMap["updatedAt"]!,
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

  FoodItemQuery whereImagePath({
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
    return _$FoodItemQuery(
      reference.where(
        _$FoodItemFieldMap["imagePath"]!,
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

  FoodItemQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
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

    return _$FoodItemQuery(query, _collection);
  }

  FoodItemQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$FoodItemFieldMap["name"]!, descending: descending);

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

    return _$FoodItemQuery(query, _collection);
  }

  FoodItemQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodItemFieldMap["description"]!,
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

    return _$FoodItemQuery(query, _collection);
  }

  FoodItemQuery orderByResturantOwnerId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodItemFieldMap["resturantOwnerId"]!,
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

    return _$FoodItemQuery(query, _collection);
  }

  FoodItemQuery orderByPrice({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$FoodItemFieldMap["price"]!, descending: descending);

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

    return _$FoodItemQuery(query, _collection);
  }

  FoodItemQuery orderByImageName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodItemFieldMap["imageName"]!,
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

    return _$FoodItemQuery(query, _collection);
  }

  FoodItemQuery orderByCategories({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodItemFieldMap["categories"]!,
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

    return _$FoodItemQuery(query, _collection);
  }

  FoodItemQuery orderByTags({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$FoodItemFieldMap["tags"]!, descending: descending);

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

    return _$FoodItemQuery(query, _collection);
  }

  FoodItemQuery orderByActive({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodItemFieldMap["active"]!,
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

    return _$FoodItemQuery(query, _collection);
  }

  FoodItemQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodItemFieldMap["createdAt"]!,
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

    return _$FoodItemQuery(query, _collection);
  }

  FoodItemQuery orderByUpdatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodItemFieldMap["updatedAt"]!,
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

    return _$FoodItemQuery(query, _collection);
  }

  FoodItemQuery orderByImagePath({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FoodItemDocumentSnapshot? startAtDocument,
    FoodItemDocumentSnapshot? endAtDocument,
    FoodItemDocumentSnapshot? endBeforeDocument,
    FoodItemDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$FoodItemFieldMap["imagePath"]!,
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

    return _$FoodItemQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$FoodItemQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class FoodItemQuerySnapshot
    extends FirestoreQuerySnapshot<FoodItem, FoodItemQueryDocumentSnapshot> {
  FoodItemQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<FoodItem> snapshot;

  @override
  final List<FoodItemQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<FoodItemDocumentSnapshot>> docChanges;
}

class FoodItemQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<FoodItem>
    implements FoodItemDocumentSnapshot {
  FoodItemQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<FoodItem> snapshot;

  @override
  FoodItemDocumentReference get reference {
    return FoodItemDocumentReference(snapshot.reference);
  }

  @override
  final FoodItem data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodItem _$FoodItemFromJson(Map<String, dynamic> json) => FoodItem(
      resturantOwnerId: json['resturantOwnerId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      imageName: json['imageName'] as String,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      active: json['active'] as bool? ?? true,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeToTimestampConverter().fromJson),
      updatedAt: const DateTimeToTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

const _$FoodItemFieldMap = <String, String>{
  'name': 'name',
  'description': 'description',
  'resturantOwnerId': 'resturantOwnerId',
  'price': 'price',
  'imageName': 'imageName',
  'categories': 'categories',
  'tags': 'tags',
  'active': 'active',
  'createdAt': 'createdAt',
  'updatedAt': 'updatedAt',
};

Map<String, dynamic> _$FoodItemToJson(FoodItem instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'resturantOwnerId': instance.resturantOwnerId,
      'price': instance.price,
      'imageName': instance.imageName,
      'categories': instance.categories,
      'tags': instance.tags,
      'active': instance.active,
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
