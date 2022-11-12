<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <img src="@/assets/plan_selection_man_color.png" width="300px"/>
    <p>
      ランダムに出題される東京都内の２つの区から人口密度の高い区を選ぼう<br>
      データは2021年10月時点です（
      <a href="https://uub.jp/rnk/cktv_j.html" target="_blank" rel="noopener">データ取得元</a>）.
    </p>
    <h3>どちらが多いでしょう？</h3>
    <ul>
      <li><button>渋谷区</button></li>
      <li><button>新宿区</button></li>
    </ul>
    <p>正解です！</p>
    <p>渋谷区：人口密度 xxx /km2 <br /> 新宿区：</p>
    <button>次の問題</button>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
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
