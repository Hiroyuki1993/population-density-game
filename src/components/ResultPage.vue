<template>
  <div>
    <h2>あなたのスコア</h2>
    <p>10問中{{score}}問正解！</p>
    <button @click="updateGameStatus">最初に戻る</button>
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
