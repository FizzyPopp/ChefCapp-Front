import "dart:async";
import "dart:convert";

import 'package:http/http.dart' as http;

import 'package:chef_capp/globals.dart';

// https://flutter.dev/docs/cookbook/networking/web-sockets
// https://flutter.dev/docs/cookbook/networking/background-parsing
// https://flutter.dev/docs/cookbook/networking/authenticated-requests
// https://flutter.dev/docs/cookbook/networking/fetch-data

class LoginBLoC {
  final state = new Globals();

  final _sinkController = StreamController<LoginEvent>();
  final _authEventController = StreamController<bool>.broadcast();

  Sink<LoginEvent> get sink => _sinkController.sink;

  Stream<bool> get authEvent => _authEventController.stream;

  LoginBLoC() {
    _sinkController.stream.listen(_handleEvent);
  }

  _handleEvent(LoginEvent event) {
    if (event is AuthEvent) {
      _handleAuthEvent(event);
    }
  }

  _handleAuthEvent(AuthEvent e) {
    // encrypt e.password

    Future<void> fetchPost() async {
      var url = "https://...";
      var body = {"username": e.username, "password": e.password};

      final response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        //return Post.fromJson(json.decode(response.body));
        state.username = "this is a username";
        _authEventController.sink.add(true);
      } else {
        throw Exception('Failed to load post');
      }
    }

    //fetchPost();

    state.username = "this is a username";
    _authEventController.sink.add(true);
  }

  dispose() {
    _sinkController.close();
    _authEventController.close();
  }
}

abstract class LoginEvent {}

class AuthEvent extends LoginEvent {
  final String username;
  final String password;

  AuthEvent(this.username, this.password);
}
