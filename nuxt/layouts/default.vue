<template>
  <v-app>
    <v-app-bar app dense>
      <p class="class_title">ハンコつくる</p>
    </v-app-bar>
    <v-main>
      <v-container>
        <nuxt />
      </v-container>
    </v-main>
    <v-footer app>
      <span>&copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<style scoped>
.class_title {
  font-family: 'Shippori Mincho';
  margin: 0;
  font-size: xx-large;
}
</style>
