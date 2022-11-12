<template>
  <div class="quiz">
    <h3>どちらが多いでしょう？</h3>
    <ul>
      <li><button>{{ city1_name }}</button></li>
      <li><button>{{ city2_name }}</button></li>
    </ul>
    <p>正解です！</p>
    <p>{{ city1_name }}：人口密度 {{ city1_density }} / ㎢ <br /> 
    {{ city2_name }}：人口密度 {{ city2_density }} / ㎢ </p>
    <button>次の問題</button>
  </div>
</template>

<script>
export default {
  name: 'PopulationQuiz',
  props: {
    city1_name: String,
    city2_name: String,
    city1_density: Number,
    city2_density: Number,
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
