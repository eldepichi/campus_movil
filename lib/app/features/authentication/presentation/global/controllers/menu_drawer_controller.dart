import '../../../domain/mappers/menu_mapper.dart';
import '../state_notifier.dart';

class MenuDrawerController extends StateNotifier<MenuMapper?> {
  MenuDrawerController() : super(null);

  void setOptions(MenuMapper newState) {
    state = newState;
  }

  void signOut() {
    state = null;
  }

  /*
  void getOptions(String perfil) async {
    final menuMapper = await menuDrawerRepository.getMenuOpcions(perfil);
    setOptions(menuMapper!);
  }
  */
}
