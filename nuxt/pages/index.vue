<template>
  <v-form name="main">
    <!-- 説明の表示 -->
    <v-row justify="center" align="center">
      <v-col cols="12">
        <p>さあ、出勤しよう</p>
      </v-col>
    </v-row>
    <!-- 社員番号入力 -->
    <v-text-field label="社員番号" outlined />
    <!-- ボタンの配置 -->
    <v-row justify="center" align="center">
      <v-col cols="12" sm="6">
        <v-btn color="primary" rounded>
          <span>出勤する</span>
        </v-btn>
      </v-col>
      <v-col cols="12" sm="6">
        <v-btn color="error" rounded>
          <span>退勤する</span>
        </v-btn>
      </v-col>
    </v-row>
  </v-form>
</template>

<style scoped lang="scss">
* {
  //outline: 1px solid lime;
}

p {
  font-family: 'Shippori Mincho';
}
</style>
