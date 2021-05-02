<template>
  <v-app>
    <v-app-bar app dense>
      <p class="title2">面倒な出退勤</p>
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
.title2 {
  font-family: 'Shippori Mincho';
  margin: 0;
  font-size: xx-large;
}
</style>
