import React from 'react';
import { StyleSheet, Button, View, Dimensions } from 'react-native';
import { StackActions, NavigationActions } from 'react-navigation';

export default class BottomNav extends React.Component {
  constructor(props) {
    super(props);

    this.handleLogout = this.handleLogout.bind(this);
  }

  handleLogout() {
    const resetAction = StackActions.reset({
        index: 0,
        actions: [NavigationActions.navigate({ routeName: 'Login' })],
    });
    this.props.navigation.dispatch(resetAction);
  }

  render() {
    return (
      <View style={styles.container}>
        <Button 
          onPress={e => this.props.navigation.navigate("Discover")}
          title="Discover"
          color="#f3f"
        />
        <Button 
          onPress={e => this.props.navigation.navigate("MyKitchen")}
          title="My Kitchen"
          color="#f3f"
        />
        <Button 
          onPress={e => this.props.navigation.navigate("Market")}
          title="Market"
          color="#f3f"
        />
        <Button 
          onPress={e => this.handleLogout()}
          title="Logout"
          color="#f3f"
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    width: Dimensions.get('window').width,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  }
});
