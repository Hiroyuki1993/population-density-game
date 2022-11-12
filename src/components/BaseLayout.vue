<template>
  <div class="base">
    <h1>{{ title }}</h1>
    <img src="@/assets/plan_selection_man_color.png" width="300px"/>
    <p>
      ランダムに出題される東京都内の２つの区から人口密度の高い区を選ぼう<br>
      データは2021年10月時点です
      （<a href="https://uub.jp/rnk/cktv_j.html" target="_blank" rel="noopener">データ取得元</a>）.
    </p>
    <PopulationQuiz city1="江戸川区" city2="新宿区" />
  </div>
</template>

<script>
import PopulationQuiz from './PopulationQuiz.vue'

export default {
  name: 'BaseLayout',
  components: {
    PopulationQuiz
  },
  props: {
    title: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
