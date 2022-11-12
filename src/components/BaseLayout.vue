<template>
  <div class="base">
    <h1>{{ title }}</h1>
    <img src="@/assets/plan_selection_man_color.png" width="300px"/>
    <p>
      ランダムに出題される東京都内の２つの区から人口密度の高い区を選ぼう<br>
      データは2021年10月時点です
      （<a href="https://uub.jp/rnk/cktv_j.html" target="_blank" rel="noopener">データ取得元</a>）
    </p>
    <PopulationQuiz 
    :city1_name = "city1_name" 
    :city2_name = "city2_name" 
    :city1_density = "city1_density"
    :city2_density = "city2_density" />
  </div>
</template>

<script>
import PopulationQuiz from './PopulationQuiz.vue'
import populations from '@/assets/population.json'

export default {
  name: 'BaseLayout',
  components: {
    PopulationQuiz
  },
  props: {
    title: String
  },
  data() {
    return {
      city1_name: populations[0]["city"],
      city2_name: populations[1]["city"],
      city1_density: populations[0]["density"],
      city2_density: populations[1]["density"]
    }
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
