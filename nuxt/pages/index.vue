<template>
  <div>
    <!-- form -->
    <v-form name="main" @submit.prevent>
      <!-- 印字入力 -->
      <v-text-field
        v-model="hanko_inzi"
        label="印字"
        name="hanko_inzi"
        outlined
        @change="on_click"
        @keydown="on_click"
      ></v-text-field>
      <!-- スライダー -->
      <v-slider
        v-model="hanko_scale"
        hint="縮小倍率"
        min="0.1"
        max="1.0"
        thumb-label="always"
        :persistent-hint="true"
        step="0.01"
        @change="on_click"
      ></v-slider>
      <!-- ハンコ描画 -->
      <v-btn @click="on_click">ハンコをつくる</v-btn>
      <!-- プレビュー -->
      <!-- ここで描画させることでフォントを読み込んでいる -->
      <v-card v-show="false">
        <span class="append_font">{{ hanko_inzi }}</span>
      </v-card>
    </v-form>
    <!-- konva -->
    <Konva-stage :config="configKonva">
      <Konva-layer>
        <Konva-circle :config="configCircle"></Konva-circle>
        <Konva-text :config="configText"></Konva-text>
      </Konva-layer>
    </Konva-stage>
  </div>
</template>

<script>
export default {
  data() {
    return {
      hanko_inzi: '',
      hanko_scale: 1.0,
      configKonva: {
        width: 200,
        height: 200,
      },
      configCircle: {
        x: 100,
        y: 100,
        radius: 50,
        fill: 'white',
        stroke: 'red',
        strokeWidth: 3,
      },
      configText: {
        text: '',
        x: 50,
        y: 50,
        fontSize: 50,
        fontStyle: 'bold',
        fontFamily: 'Shippori Mincho',
        fill: 'red',
        draggable: true,
        align: 'right',
        scaleX: 0.5,
      },
    }
  },
  mounted() {
    this.on_click()
  },
  methods: {
    on_click() {
      this.configText.text = this.hanko_inzi
      this.configText.scaleX = this.hanko_scale
    },
  },
}
</script>

<style scoped lang="scss">
.append_font {
  font-family: 'Shippori Mincho';
}
</style>
