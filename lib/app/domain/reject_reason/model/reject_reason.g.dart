// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_reason.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class RejectReasonCollectionReference
    implements
        RejectReasonQuery,
        FirestoreCollectionReference<RejectReason, RejectReasonQuerySnapshot> {
  factory RejectReasonCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$RejectReasonCollectionReference;

  static RejectReason fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return RejectReason.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    RejectReason value,
    SetOptions? options,
  ) {
    return {..._$RejectReasonToJson(value)}..remove('id');
  }

  @override
  CollectionReference<RejectReason> get reference;

  @override
  RejectReasonDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RejectReasonDocumentReference> add(RejectReason value);
}

class _$RejectReasonCollectionReference extends _$RejectReasonQuery
    implements RejectReasonCollectionReference {
  factory _$RejectReasonCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$RejectReasonCollectionReference._(
      firestore.collection('RejectReason').withConverter(
            fromFirestore: RejectReasonCollectionReference.fromFirestore,
            toFirestore: RejectReasonCollectionReference.toFirestore,
          ),
    );
  }

  _$RejectReasonCollectionReference._(
    CollectionReference<RejectReason> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<RejectReason> get reference =>
      super.reference as CollectionReference<RejectReason>;

  @override
  RejectReasonDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return RejectReasonDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<RejectReasonDocumentReference> add(RejectReason value) {
    return reference
        .add(value)
        .then((ref) => RejectReasonDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$RejectReasonCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class RejectReasonDocumentReference extends FirestoreDocumentReference<
    RejectReason, RejectReasonDocumentSnapshot> {
  factory RejectReasonDocumentReference(
          DocumentReference<RejectReason> reference) =
      _$RejectReasonDocumentReference;

  DocumentReference<RejectReason> get reference;

  /// A reference to the [RejectReasonCollectionReference] containing this document.
  RejectReasonCollectionReference get parent {
    return _$RejectReasonCollectionReference(reference.firestore);
  }

  @override
  Stream<RejectReasonDocumentSnapshot> snapshots();

  @override
  Future<RejectReasonDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String restaurantId,
    FieldValue restaurantIdFieldValue,
    String orderId,
    FieldValue orderIdFieldValue,
    String customerId,
    FieldValue customerIdFieldValue,
    String reason,
    FieldValue reasonFieldValue,
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    DateTime updatedAt,
    FieldValue updatedAtFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String restaurantId,
    FieldValue restaurantIdFieldValue,
    String orderId,
    FieldValue orderIdFieldValue,
    String customerId,
    FieldValue customerIdFieldValue,
    String reason,
    FieldValue reasonFieldValue,
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    DateTime updatedAt,
    FieldValue updatedAtFieldValue,
  });
}

class _$RejectReasonDocumentReference extends FirestoreDocumentReference<
    RejectReason,
    RejectReasonDocumentSnapshot> implements RejectReasonDocumentReference {
  _$RejectReasonDocumentReference(this.reference);

  @override
  final DocumentReference<RejectReason> reference;

  /// A reference to the [RejectReasonCollectionReference] containing this document.
  RejectReasonCollectionReference get parent {
    return _$RejectReasonCollectionReference(reference.firestore);
  }

  @override
  Stream<RejectReasonDocumentSnapshot> snapshots() {
    return reference.snapshots().map(RejectReasonDocumentSnapshot._);
  }

  @override
  Future<RejectReasonDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(RejectReasonDocumentSnapshot._);
  }

  @override
  Future<RejectReasonDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(RejectReasonDocumentSnapshot._);
  }

  Future<void> update({
    Object? restaurantId = _sentinel,
    FieldValue? restaurantIdFieldValue,
    Object? orderId = _sentinel,
    FieldValue? orderIdFieldValue,
    Object? customerId = _sentinel,
    FieldValue? customerIdFieldValue,
    Object? reason = _sentinel,
    FieldValue? reasonFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
  }) async {
    assert(
      restaurantId == _sentinel || restaurantIdFieldValue == null,
      "Cannot specify both restaurantId and restaurantIdFieldValue",
    );
    assert(
      orderId == _sentinel || orderIdFieldValue == null,
      "Cannot specify both orderId and orderIdFieldValue",
    );
    assert(
      customerId == _sentinel || customerIdFieldValue == null,
      "Cannot specify both customerId and customerIdFieldValue",
    );
    assert(
      reason == _sentinel || reasonFieldValue == null,
      "Cannot specify both reason and reasonFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    final json = {
      if (restaurantId != _sentinel) 'restaurantId': restaurantId as String,
      if (restaurantIdFieldValue != null)
        'restaurantId': restaurantIdFieldValue,
      if (orderId != _sentinel) 'orderId': orderId as String,
      if (orderIdFieldValue != null) 'orderId': orderIdFieldValue,
      if (customerId != _sentinel) 'customerId': customerId as String,
      if (customerIdFieldValue != null) 'customerId': customerIdFieldValue,
      if (reason != _sentinel) 'reason': reason as String,
      if (reasonFieldValue != null) 'reason': reasonFieldValue,
      if (createdAt != _sentinel) 'createdAt': createdAt as DateTime?,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (updatedAt != _sentinel) 'updatedAt': updatedAt as DateTime,
      if (updatedAtFieldValue != null) 'updatedAt': updatedAtFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? restaurantId = _sentinel,
    FieldValue? restaurantIdFieldValue,
    Object? orderId = _sentinel,
    FieldValue? orderIdFieldValue,
    Object? customerId = _sentinel,
    FieldValue? customerIdFieldValue,
    Object? reason = _sentinel,
    FieldValue? reasonFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
  }) {
    assert(
      restaurantId == _sentinel || restaurantIdFieldValue == null,
      "Cannot specify both restaurantId and restaurantIdFieldValue",
    );
    assert(
      orderId == _sentinel || orderIdFieldValue == null,
      "Cannot specify both orderId and orderIdFieldValue",
    );
    assert(
      customerId == _sentinel || customerIdFieldValue == null,
      "Cannot specify both customerId and customerIdFieldValue",
    );
    assert(
      reason == _sentinel || reasonFieldValue == null,
      "Cannot specify both reason and reasonFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    final json = {
      if (restaurantId != _sentinel) 'restaurantId': restaurantId as String,
      if (restaurantIdFieldValue != null)
        'restaurantId': restaurantIdFieldValue,
      if (orderId != _sentinel) 'orderId': orderId as String,
      if (orderIdFieldValue != null) 'orderId': orderIdFieldValue,
      if (customerId != _sentinel) 'customerId': customerId as String,
      if (customerIdFieldValue != null) 'customerId': customerIdFieldValue,
      if (reason != _sentinel) 'reason': reason as String,
      if (reasonFieldValue != null) 'reason': reasonFieldValue,
      if (createdAt != _sentinel) 'createdAt': createdAt as DateTime?,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (updatedAt != _sentinel) 'updatedAt': updatedAt as DateTime,
      if (updatedAtFieldValue != null) 'updatedAt': updatedAtFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is RejectReasonDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class RejectReasonQuery
    implements QueryReference<RejectReason, RejectReasonQuerySnapshot> {
  @override
  RejectReasonQuery limit(int limit);

  @override
  RejectReasonQuery limitToLast(int limit);

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
  RejectReasonQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
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
  RejectReasonQuery whereFieldPath(
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

  RejectReasonQuery whereDocumentId({
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
  RejectReasonQuery whereRestaurantId({
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
  RejectReasonQuery whereOrderId({
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
  RejectReasonQuery whereCustomerId({
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
  RejectReasonQuery whereReason({
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
  RejectReasonQuery whereCreatedAt({
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
  RejectReasonQuery whereUpdatedAt({
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

  RejectReasonQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  });

  RejectReasonQuery orderByRestaurantId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  });

  RejectReasonQuery orderByOrderId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  });

  RejectReasonQuery orderByCustomerId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  });

  RejectReasonQuery orderByReason({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  });

  RejectReasonQuery orderByCreatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  });

  RejectReasonQuery orderByUpdatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  });
}

class _$RejectReasonQuery
    extends QueryReference<RejectReason, RejectReasonQuerySnapshot>
    implements RejectReasonQuery {
  _$RejectReasonQuery(
    this._collection, {
    required Query<RejectReason> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<RejectReasonQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(RejectReasonQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<RejectReasonQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(RejectReasonQuerySnapshot._fromQuerySnapshot);
  }

  @override
  RejectReasonQuery limit(int limit) {
    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RejectReasonQuery limitToLast(int limit) {
    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  RejectReasonQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RejectReasonQuery whereFieldPath(
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
    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
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
      $queryCursor: $queryCursor,
    );
  }

  RejectReasonQuery whereDocumentId({
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
    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
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
      $queryCursor: $queryCursor,
    );
  }

  RejectReasonQuery whereRestaurantId({
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
    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RejectReasonFieldMap['restaurantId']!,
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
      $queryCursor: $queryCursor,
    );
  }

  RejectReasonQuery whereOrderId({
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
    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RejectReasonFieldMap['orderId']!,
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
      $queryCursor: $queryCursor,
    );
  }

  RejectReasonQuery whereCustomerId({
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
    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RejectReasonFieldMap['customerId']!,
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
      $queryCursor: $queryCursor,
    );
  }

  RejectReasonQuery whereReason({
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
    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RejectReasonFieldMap['reason']!,
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
      $queryCursor: $queryCursor,
    );
  }

  RejectReasonQuery whereCreatedAt({
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
    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RejectReasonFieldMap['createdAt']!,
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
      $queryCursor: $queryCursor,
    );
  }

  RejectReasonQuery whereUpdatedAt({
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
    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RejectReasonFieldMap['updatedAt']!,
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
      $queryCursor: $queryCursor,
    );
  }

  RejectReasonQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RejectReasonQuery orderByRestaurantId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$RejectReasonFieldMap['restaurantId']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RejectReasonQuery orderByOrderId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RejectReasonFieldMap['orderId']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RejectReasonQuery orderByCustomerId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RejectReasonFieldMap['customerId']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RejectReasonQuery orderByReason({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RejectReasonFieldMap['reason']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RejectReasonQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RejectReasonFieldMap['createdAt']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RejectReasonQuery orderByUpdatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RejectReasonDocumentSnapshot? startAtDocument,
    RejectReasonDocumentSnapshot? endAtDocument,
    RejectReasonDocumentSnapshot? endBeforeDocument,
    RejectReasonDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RejectReasonFieldMap['updatedAt']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RejectReasonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$RejectReasonQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class RejectReasonDocumentSnapshot
    extends FirestoreDocumentSnapshot<RejectReason> {
  RejectReasonDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<RejectReason> snapshot;

  @override
  RejectReasonDocumentReference get reference {
    return RejectReasonDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final RejectReason? data;
}

class RejectReasonQuerySnapshot extends FirestoreQuerySnapshot<RejectReason,
    RejectReasonQueryDocumentSnapshot> {
  RejectReasonQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory RejectReasonQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<RejectReason> snapshot,
  ) {
    final docs =
        snapshot.docs.map(RejectReasonQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        RejectReasonDocumentSnapshot._,
      );
    }).toList();

    return RejectReasonQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<RejectReasonDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    RejectReasonDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<RejectReasonDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<RejectReason> snapshot;

  @override
  final List<RejectReasonQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RejectReasonDocumentSnapshot>> docChanges;
}

class RejectReasonQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<RejectReason>
    implements RejectReasonDocumentSnapshot {
  RejectReasonQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<RejectReason> snapshot;

  @override
  final RejectReason data;

  @override
  RejectReasonDocumentReference get reference {
    return RejectReasonDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectReason _$RejectReasonFromJson(Map<String, dynamic> json) => RejectReason(
      id: json['id'] as String? ?? '',
      restaurantId: json['restaurantId'] as String,
      customerId: json['customerId'] as String,
      orderId: json['orderId'] as String,
      reason: json['reason'] as String,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeToTimestampConverter().fromJson),
      updatedAt: const DateTimeToTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

const _$RejectReasonFieldMap = <String, String>{
  'id': 'id',
  'restaurantId': 'restaurantId',
  'orderId': 'orderId',
  'customerId': 'customerId',
  'reason': 'reason',
  'createdAt': 'createdAt',
  'updatedAt': 'updatedAt',
};

Map<String, dynamic> _$RejectReasonToJson(RejectReason instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurantId': instance.restaurantId,
      'orderId': instance.orderId,
      'customerId': instance.customerId,
      'reason': instance.reason,
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
