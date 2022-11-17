<template>
  <div>
    <img src="@/assets/plan_selection_man_color.png" width="300px"/>
    <p>
      ランダムに出題される東京都内の２つの区から人口密度の高い区を選ぼう<br>
      データは2021年10月時点です
      （<a href="https://uub.jp/rnk/cktv_j.html" target="_blank" rel="noopener">データ取得元</a>）
    </p>
    <button @click="startGame">クイズを始める</button>
  </div>
</template>

<script>
export default({
  name: 'StartPage',
  methods: {
    startGame () {
      this.$emit('parentMethod', 1)
    }
  }
})
</script>
