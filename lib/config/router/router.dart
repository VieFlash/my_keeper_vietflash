
import 'package:fluro/fluro.dart';
import 'package:my_keeper_vietflash/config/router/ui/page_not_found.dart';

final appRouter = FluroRouter();

Future<void> configureRouters() async {
  appRouter.notFoundHandler = Handler(handlerFunc: (_, __) {
    return const PageNotFound();
  });
}