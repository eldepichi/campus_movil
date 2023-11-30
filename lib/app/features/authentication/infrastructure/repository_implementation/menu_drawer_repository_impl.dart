import '../../domain/mappers/menu_mapper.dart';
import '../../domain/models/menu/menu.dart';
import '../../domain/repositories/menu_drawer_repository.dart';
import '../service/remote/menu_drawer_api.dart';

class MenuDrawerRepositoryImpl implements MenuDrawerRepository {
  const MenuDrawerRepositoryImpl(this._menuApi);
  final MenuDrawerApi _menuApi;

  @override
  Future<MenuMapper?> getMenuOpcions(String perfil) async {
    final responseOptions = await _menuApi.menuOpcions(perfil);

    return responseOptions.when(
      (authError) {
        return null;
      },
      (menuMapper) {
        return MenuMapper(
          success: menuMapper!.success,
          registro: menuMapper.registro,
          menuItems: [
            ...menuMapper.menuItems!,
            const MenuItem(
              nombre: 'Salir',
              ruta: '/salir',
              imageIcon: 'logout.webp',
              amount: 0,
            ),
          ],
          estatus: menuMapper.estatus,
          message: menuMapper.message,
        );
      },
    );
  }
}
