class Role {
  final String title;

  Role(this.title);
}

class RoleView {
  late String title;

  RoleView(this.title);
  
  RoleView.fromRole(Role role) {
    title = role.title;
  }
}