// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resturant_owner.dart';

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
abstract class ResturantOwnerCollectionReference
    implements
        ResturantOwnerQuery,
        FirestoreCollectionReference<ResturantOwner,
            ResturantOwnerQuerySnapshot> {
  factory ResturantOwnerCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$ResturantOwnerCollectionReference;

  static ResturantOwner fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return ResturantOwner.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    ResturantOwner value,
    SetOptions? options,
  ) {
    return _$ResturantOwnerToJson(value);
  }

  @override
  CollectionReference<ResturantOwner> get reference;

  @override
  ResturantOwnerDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ResturantOwnerDocumentReference> add(ResturantOwner value);
}

class _$ResturantOwnerCollectionReference extends _$ResturantOwnerQuery
    implements ResturantOwnerCollectionReference {
  factory _$ResturantOwnerCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$ResturantOwnerCollectionReference._(
      firestore.collection('Resturant').withConverter(
            fromFirestore: ResturantOwnerCollectionReference.fromFirestore,
            toFirestore: ResturantOwnerCollectionReference.toFirestore,
          ),
    );
  }

  _$ResturantOwnerCollectionReference._(
    CollectionReference<ResturantOwner> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<ResturantOwner> get reference =>
      super.reference as CollectionReference<ResturantOwner>;

  @override
  ResturantOwnerDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ResturantOwnerDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ResturantOwnerDocumentReference> add(ResturantOwner value) {
    return reference
        .add(value)
        .then((ref) => ResturantOwnerDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ResturantOwnerCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ResturantOwnerDocumentReference
    extends FirestoreDocumentReference<ResturantOwner,
        ResturantOwnerDocumentSnapshot> {
  factory ResturantOwnerDocumentReference(
          DocumentReference<ResturantOwner> reference) =
      _$ResturantOwnerDocumentReference;

  DocumentReference<ResturantOwner> get reference;

  /// A reference to the [ResturantOwnerCollectionReference] containing this document.
  ResturantOwnerCollectionReference get parent {
    return _$ResturantOwnerCollectionReference(reference.firestore);
  }

  @override
  Stream<ResturantOwnerDocumentSnapshot> snapshots();

  @override
  Future<ResturantOwnerDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String resturantName,
    String name,
    String phone,
    String address,
    String bannerImagePath,
    List<String> resturantTags,
    DateTime? createdAt,
    DateTime updatedAt,
    bool active,
  });

  Future<void> set(ResturantOwner value);
}

class _$ResturantOwnerDocumentReference extends FirestoreDocumentReference<
    ResturantOwner,
    ResturantOwnerDocumentSnapshot> implements ResturantOwnerDocumentReference {
  _$ResturantOwnerDocumentReference(this.reference);

  @override
  final DocumentReference<ResturantOwner> reference;

  /// A reference to the [ResturantOwnerCollectionReference] containing this document.
  ResturantOwnerCollectionReference get parent {
    return _$ResturantOwnerCollectionReference(reference.firestore);
  }

  @override
  Stream<ResturantOwnerDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return ResturantOwnerDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<ResturantOwnerDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return ResturantOwnerDocumentSnapshot._(
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
    Object? resturantName = _sentinel,
    Object? name = _sentinel,
    Object? phone = _sentinel,
    Object? address = _sentinel,
    Object? bannerImagePath = _sentinel,
    Object? resturantTags = _sentinel,
    Object? createdAt = _sentinel,
    Object? updatedAt = _sentinel,
    Object? active = _sentinel,
  }) async {
    final json = {
      if (resturantName != _sentinel) "resturantName": resturantName as String,
      if (name != _sentinel) "name": name as String,
      if (phone != _sentinel) "phone": phone as String,
      if (address != _sentinel) "address": address as String,
      if (bannerImagePath != _sentinel)
        "bannerImagePath": bannerImagePath as String,
      if (resturantTags != _sentinel)
        "resturantTags": resturantTags as List<String>,
      if (createdAt != _sentinel) "createdAt": createdAt as DateTime?,
      if (updatedAt != _sentinel) "updatedAt": updatedAt as DateTime,
      if (active != _sentinel) "active": active as bool,
    };

    return reference.update(json);
  }

  Future<void> set(ResturantOwner value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is ResturantOwnerDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class ResturantOwnerDocumentSnapshot
    extends FirestoreDocumentSnapshot<ResturantOwner> {
  ResturantOwnerDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<ResturantOwner> snapshot;

  @override
  ResturantOwnerDocumentReference get reference {
    return ResturantOwnerDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final ResturantOwner? data;
}

abstract class ResturantOwnerQuery
    implements QueryReference<ResturantOwner, ResturantOwnerQuerySnapshot> {
  @override
  ResturantOwnerQuery limit(int limit);

  @override
  ResturantOwnerQuery limitToLast(int limit);

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
  ResturantOwnerQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
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
  ResturantOwnerQuery whereFieldPath(
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

  ResturantOwnerQuery whereDocumentId({
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
  ResturantOwnerQuery whereResturantName({
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
  ResturantOwnerQuery whereName({
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
  ResturantOwnerQuery wherePhone({
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
  ResturantOwnerQuery whereAddress({
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
  ResturantOwnerQuery whereBannerImagePath({
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
  ResturantOwnerQuery whereResturantTags({
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
  ResturantOwnerQuery whereCreatedAt({
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
  ResturantOwnerQuery whereUpdatedAt({
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
  ResturantOwnerQuery whereActive({
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

  ResturantOwnerQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  });

  ResturantOwnerQuery orderByResturantName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  });

  ResturantOwnerQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  });

  ResturantOwnerQuery orderByPhone({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  });

  ResturantOwnerQuery orderByAddress({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  });

  ResturantOwnerQuery orderByBannerImagePath({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  });

  ResturantOwnerQuery orderByResturantTags({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  });

  ResturantOwnerQuery orderByCreatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  });

  ResturantOwnerQuery orderByUpdatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  });

  ResturantOwnerQuery orderByActive({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  });
}

class _$ResturantOwnerQuery
    extends QueryReference<ResturantOwner, ResturantOwnerQuerySnapshot>
    implements ResturantOwnerQuery {
  _$ResturantOwnerQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<ResturantOwner> reference;

  ResturantOwnerQuerySnapshot _decodeSnapshot(
    QuerySnapshot<ResturantOwner> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return ResturantOwnerQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<ResturantOwnerDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: ResturantOwnerDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return ResturantOwnerQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<ResturantOwnerQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<ResturantOwnerQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  ResturantOwnerQuery limit(int limit) {
    return _$ResturantOwnerQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  ResturantOwnerQuery limitToLast(int limit) {
    return _$ResturantOwnerQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  ResturantOwnerQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
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

    return _$ResturantOwnerQuery(query, _collection);
  }

  ResturantOwnerQuery whereFieldPath(
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
    return _$ResturantOwnerQuery(
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

  ResturantOwnerQuery whereDocumentId({
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
    return _$ResturantOwnerQuery(
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

  ResturantOwnerQuery whereResturantName({
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
    return _$ResturantOwnerQuery(
      reference.where(
        _$ResturantOwnerFieldMap["resturantName"]!,
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

  ResturantOwnerQuery whereName({
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
    return _$ResturantOwnerQuery(
      reference.where(
        _$ResturantOwnerFieldMap["name"]!,
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

  ResturantOwnerQuery wherePhone({
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
    return _$ResturantOwnerQuery(
      reference.where(
        _$ResturantOwnerFieldMap["phone"]!,
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

  ResturantOwnerQuery whereAddress({
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
    return _$ResturantOwnerQuery(
      reference.where(
        _$ResturantOwnerFieldMap["address"]!,
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

  ResturantOwnerQuery whereBannerImagePath({
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
    return _$ResturantOwnerQuery(
      reference.where(
        _$ResturantOwnerFieldMap["bannerImagePath"]!,
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

  ResturantOwnerQuery whereResturantTags({
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
    return _$ResturantOwnerQuery(
      reference.where(
        _$ResturantOwnerFieldMap["resturantTags"]!,
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

  ResturantOwnerQuery whereCreatedAt({
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
    return _$ResturantOwnerQuery(
      reference.where(
        _$ResturantOwnerFieldMap["createdAt"]!,
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

  ResturantOwnerQuery whereUpdatedAt({
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
    return _$ResturantOwnerQuery(
      reference.where(
        _$ResturantOwnerFieldMap["updatedAt"]!,
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

  ResturantOwnerQuery whereActive({
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
    return _$ResturantOwnerQuery(
      reference.where(
        _$ResturantOwnerFieldMap["active"]!,
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

  ResturantOwnerQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
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

    return _$ResturantOwnerQuery(query, _collection);
  }

  ResturantOwnerQuery orderByResturantName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$ResturantOwnerFieldMap["resturantName"]!,
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

    return _$ResturantOwnerQuery(query, _collection);
  }

  ResturantOwnerQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$ResturantOwnerFieldMap["name"]!,
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

    return _$ResturantOwnerQuery(query, _collection);
  }

  ResturantOwnerQuery orderByPhone({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$ResturantOwnerFieldMap["phone"]!,
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

    return _$ResturantOwnerQuery(query, _collection);
  }

  ResturantOwnerQuery orderByAddress({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$ResturantOwnerFieldMap["address"]!,
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

    return _$ResturantOwnerQuery(query, _collection);
  }

  ResturantOwnerQuery orderByBannerImagePath({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$ResturantOwnerFieldMap["bannerImagePath"]!,
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

    return _$ResturantOwnerQuery(query, _collection);
  }

  ResturantOwnerQuery orderByResturantTags({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$ResturantOwnerFieldMap["resturantTags"]!,
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

    return _$ResturantOwnerQuery(query, _collection);
  }

  ResturantOwnerQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$ResturantOwnerFieldMap["createdAt"]!,
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

    return _$ResturantOwnerQuery(query, _collection);
  }

  ResturantOwnerQuery orderByUpdatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$ResturantOwnerFieldMap["updatedAt"]!,
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

    return _$ResturantOwnerQuery(query, _collection);
  }

  ResturantOwnerQuery orderByActive({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ResturantOwnerDocumentSnapshot? startAtDocument,
    ResturantOwnerDocumentSnapshot? endAtDocument,
    ResturantOwnerDocumentSnapshot? endBeforeDocument,
    ResturantOwnerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$ResturantOwnerFieldMap["active"]!,
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

    return _$ResturantOwnerQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$ResturantOwnerQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ResturantOwnerQuerySnapshot extends FirestoreQuerySnapshot<ResturantOwner,
    ResturantOwnerQueryDocumentSnapshot> {
  ResturantOwnerQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<ResturantOwner> snapshot;

  @override
  final List<ResturantOwnerQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ResturantOwnerDocumentSnapshot>>
      docChanges;
}

class ResturantOwnerQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<ResturantOwner>
    implements ResturantOwnerDocumentSnapshot {
  ResturantOwnerQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<ResturantOwner> snapshot;

  @override
  ResturantOwnerDocumentReference get reference {
    return ResturantOwnerDocumentReference(snapshot.reference);
  }

  @override
  final ResturantOwner data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResturantOwner _$ResturantOwnerFromJson(Map<String, dynamic> json) =>
    ResturantOwner(
      resturantName: json['resturantName'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      coordinates:
          const LatLngConverter().fromJson(json['coordinates'] as Object),
      openingTime: const TimeOfDayToTimestampConverter()
          .fromJson(json['openingTime'] as Timestamp),
      closingTime: const TimeOfDayToTimestampConverter()
          .fromJson(json['closingTime'] as Timestamp),
      resturantTags: (json['resturantTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      bannerImagePath: json['bannerImagePath'] as String? ?? '',
      active: json['active'] as bool? ?? true,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeToTimestampConverter().fromJson),
      updatedAt: const DateTimeToTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

const _$ResturantOwnerFieldMap = <String, String>{
  'resturantName': 'resturantName',
  'name': 'name',
  'phone': 'phone',
  'address': 'address',
  'bannerImagePath': 'bannerImagePath',
  'resturantTags': 'resturantTags',
  'openingTime': 'openingTime',
  'closingTime': 'closingTime',
  'coordinates': 'coordinates',
  'createdAt': 'createdAt',
  'updatedAt': 'updatedAt',
  'active': 'active',
};

Map<String, dynamic> _$ResturantOwnerToJson(ResturantOwner instance) =>
    <String, dynamic>{
      'resturantName': instance.resturantName,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'bannerImagePath': instance.bannerImagePath,
      'resturantTags': instance.resturantTags,
      'openingTime':
          const TimeOfDayToTimestampConverter().toJson(instance.openingTime),
      'closingTime':
          const TimeOfDayToTimestampConverter().toJson(instance.closingTime),
      'coordinates': const LatLngConverter().toJson(instance.coordinates),
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeToTimestampConverter().toJson),
      'updatedAt':
          const DateTimeToTimestampConverter().toJson(instance.updatedAt),
      'active': instance.active,
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
