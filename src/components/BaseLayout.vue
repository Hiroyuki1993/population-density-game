<template>
  <div class="container">
    <h1 class="title">４７都道府県<br>人口密度クイズ</h1>
    <StartPage v-if="gameStatus==0" @parentMethod="updateGameStatus" />
    <QuizPage v-if="gameStatus==1" @parentMethod="updateGameStatus" @updateScore="updateGameScore"/>
    <ResultPage v-if="gameStatus==2" @parentMethod="updateGameStatus" :score="gameScore" />
  </div>
</template>

<script>
import StartPage from './StartPage.vue'
import QuizPage from './QuizPage.vue'
import ResultPage from './ResultPage.vue'

export default {
  name: 'BaseLayout',
  components: {
    StartPage,
    QuizPage,
    ResultPage,
  },
  props: {
  },
  data () {
    return {
      // game の状態を管理する
      gameStatus: 0,
      gameScore: 0,
    }
  },
  methods: {
    updateGameStatus (status) {
      this.gameStatus = status;
    },
    updateGameScore (score) {
      this.gameScore = score;
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
