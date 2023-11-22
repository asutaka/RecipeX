part of 'post_store.dart';

mixin _$PostStore on _PostStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_PostStore.loading'))
      .value;

  late final _$fetchPostsFutureAtom =
      Atom(name: '_PostStore.fetchPostsFuture', context: context);

  @override
  ObservableFuture<PostList?> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<PostList?> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  late final _$postListAtom =
      Atom(name: '_PostStore.postList', context: context);

  @override
  PostList? get postList {
    _$postListAtom.reportRead();
    return super.postList;
  }

  late final _$lVideoAtom = Atom(name: '_PostStore.lVideo', context: context);
  late final _$lResourceAtom =
      Atom(name: '_PostStore.lResource', context: context);

  @override
  ListResourceDTO? get lResource {
    _$lResourceAtom.reportRead();
    return super.lResource;
  }

  @override
  set postList(PostList? value) {
    _$postListAtom.reportWrite(value, super.postList, () {
      super.postList = value;
    });
  }

  @override
  set lVideo(ListVideoAPIDTO? value) {
    _$lVideoAtom.reportWrite(value, super.lVideo, () {
      super.lVideo = value;
    });
  }

  @override
  set lResource(ListResourceDTO? value) {
    _$lResourceAtom.reportWrite(value, super.lResource, () {
      super.lResource = value;
    });
  }

  late final _$successAtom = Atom(name: '_PostStore.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$getPostsAsyncAction =
      AsyncAction('_PostStore.getPosts', context: context);

  late final _$getVideoAsyncAction =
      AsyncAction('_PostStore.getVideo', context: context);

  late final _$getResourceAsyncAction =
      AsyncAction('_PostStore.getResource', context: context);

  @override
  Future<dynamic> getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  @override
  Future<dynamic> getVideo() {
    return _$getVideoAsyncAction.run(() => super.getVideo());
  }

  @override
  Future<dynamic> getResource() {
    return _$getResourceAsyncAction.run(() => super.getResource());
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
postList: ${postList},
success: ${success},
loading: ${loading}
    ''';
  }
}
