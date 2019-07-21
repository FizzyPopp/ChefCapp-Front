import React from 'react';
import { StyleSheet, Button, Text, View, Dimensions } from 'react-native';

import BottomNav from "./../common/BottomNav.js";

export default class MyKitchen extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <View style={styles.container}>
        <Text>My Kitchen</Text>
        <BottomNav navigation={this.props.navigation} />
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
