import React from 'react';
import { StyleSheet, Button, Text, View, Dimensions } from 'react-native';


export default class SignUp extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <View style={styles.container}>
        <Text>Sign Up</Text>
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
