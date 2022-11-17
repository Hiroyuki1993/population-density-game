<template>
  <div>
    <img src="@/assets/plan_selection_man_color.png" width="300px"/>
    <div class="notification">
      ランダムに出題される都道府県から<br>人口密度の高い県を選ぼう（全１０問）<br>
    </div>
    <div class="block">
      <button @click="startGame" class="button is-primary is-light">クイズを始める</button>
    </div>
    <footer class="footer">
      <div class="content has-text-centered">
        <p>データ提供：<a href="https://uub.jp/rnk/p_j.html" target="_blank">都道府県人口密度ランキング</a></p>
        <p>イラスト提供：<a href="https://tyoudoii-illust.com/" target="_blank">ちょうどいいイラスト</a></p>
      </div>
    </footer>
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
