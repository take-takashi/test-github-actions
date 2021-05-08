<template>
  <v-app>
    <v-app-bar app dense>
      <v-toolbar-title class="class_title">
        <span>ハンコつくる</span>
      </v-toolbar-title>
      <v-tabs>
        <v-tab to="/">top</v-tab>
        <v-tab to="transformer">transformer</v-tab>
      </v-tabs>
    </v-app-bar>
    <v-main>
      <v-container>
        <Nuxt />
      </v-container>
    </v-main>
    <v-footer app>
      <span>&copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<style scoped lang="scss">
.class_title {
  font-family: 'Shippori Mincho';
  margin: 0;
  font-size: xx-large;
  overflow: visible;
  text-overflow: unset;
}
</style>
