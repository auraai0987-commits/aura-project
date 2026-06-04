import { Text, View } from 'react-native';

export default function MobileHome() {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: '#080B12' }}>
      <Text style={{ color: '#D4AF37', fontSize: 28, fontWeight: '700' }}>AURA Mobile</Text>
      <Text style={{ color: '#F8FAFC', marginTop: 8 }}>Expo shell for AURA v2</Text>
    </View>
  );
}
