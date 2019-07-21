import React from 'react';
import { StyleSheet, Button, Text, View, Dimensions } from 'react-native';
import { StackActions, NavigationActions } from 'react-navigation';

export default class Login extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      email: '',
      password: '',
      id: '',
    };

    this.sonPressSignup = this.onPressSignUp.bind(this);
    this.onPressLogin = this.onPressLogin.bind(this);
  }

  onPressSignUp() {
    this.props.navigation.navigate("SignUp");
  }

  onPressLogin() {
    const resetAction = StackActions.reset({
      index: 0,
      actions: [NavigationActions.navigate({ routeName: 'Discover' })],
    });
    this.props.navigation.dispatch(resetAction);
  }

  render() {
    return (
      <View style={styles.container}>
        <Text>Login</Text>
        <Button 
          onPress={e => this.onPressSignUp()}
          title="Get Started"
          color="#f3f"
        />
        <Button 
        onPress={e => this.onPressLogin()}
        title="Login"
        color="#f3f"
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    width: Dimensions.get('window').width,
    height: Dimensions.get('window').height,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
