class QualifiedPath {
  final List<String> _segments;
  const QualifiedPath._(this._segments);
  factory QualifiedPath.empty() => const QualifiedPath._([]);
  factory QualifiedPath.top(String semgent) => QualifiedPath._([semgent]);
  QualifiedPath withPrefix(String newSegment) =>
      QualifiedPath._([newSegment, ..._segments]);
  QualifiedPath withSuffix(String newSegment) =>
      QualifiedPath._([..._segments, newSegment]);
  QualifiedPath operator /(String newSegment) => withSuffix(newSegment);
  String asString({String sep = "/"}) {
    return _segments.join(sep);
  }
}

typedef ChildMap<P> = Map<String, TreeNode<P>>;

abstract class TreeNode<P> {
  String id;
  P props;
  TreeNode<P>? parent;
  TreeNode({required this.id, required this.props, this.parent});
  QualifiedPath get qualifiedPath =>
      parent?.qualifiedPath.withSuffix(id) ?? QualifiedPath.top(id);

  ChildMap get children;

  void visitNodes(VisitorFn<P> visitorFn);
  void visitLeafs(VisitorFn<P> visitorFn) {
    visitNodes((node) {
      if (node is TreeLeaf) {
        visitorFn(node);
      }
    });
  }

  Map<String, Object> encode();
}

class TreeLeaf<P> extends TreeNode<P> {
  TreeLeaf({required super.id, required super.props, super.parent});

  @override
  ChildMap get children => <String, TreeNode<P>>{};

  @override
  void visitNodes(VisitorFn<P> visitorFn) {
    visitorFn(this);
  }

  @override
  Map<String, Object> encode() => {};
}

typedef VisitorFn<P> = Function(TreeNode<P> node);

class TreeBranch<P> extends TreeNode<P> {
  final Map<String, TreeNode<P>> _children;

  TreeBranch(
      {required super.id,
      required super.props,
      required Map<String, TreeNode<P>> children,
      super.parent})
      : _children = children;

  factory TreeBranch.empty({required String id, required P props}) =>
      TreeBranch(id: id, props: props, children: <String, TreeNode<P>>{});

  @override
  ChildMap get children => _children;

  @override
  void visitNodes(VisitorFn<P> visitorFn) {
    for (var entry in _children.values) {
      if (entry is TreeBranch<P>) {
        entry.visitNodes(visitorFn);
      }
      visitorFn(entry);
    }
  }

  @override
  Map<String, Object> encode() {
    Map<String, Object> result = {};
    for (var entry in _children.entries) {
      result[entry.key] = entry.value.encode();
    }
    return result;
  }

  TreeBranch<P> add(TreeNode<P> node) {
    _children[node.id] = node;
    node.parent = this;
    return this;
  }
}

abstract class TreeSource<P> {
  TreeNode<P> asTree();
}
