<template>
  <div>
    <h3 class="title">あなたのスコア</h3>
    <h2 class="title">10問中{{score}}問正解！</h2>
    <button @click="updateGameStatus" class="button is-primary is-light">最初に戻る</button>
  </div>
</template>
<script>

export default {
  name: 'ResultPage',
  props: {
    score: Number,
  },
  methods: {
    updateGameStatus () {
      this.$emit("parentMethod", 0)
    }
  }
}
</script>
