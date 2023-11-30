import '../mappers/menu_mapper.dart';

abstract class MenuDrawerRepository {
  Future<MenuMapper?> getMenuOpcions(String perfil);
}
