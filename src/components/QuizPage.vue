<template>
  <div class="content">
    <h2 class="title">第{{this.quiz_completed+1}}/10問</h2>
    <div class="block">人口密度が高いのはどちらでしょうか？</div>
    <ul>
      <li>
        <button @click="answerQuiz" class="button is-primary is-large">
          {{ pref1["name"] }}
        </button>
      </li>
      <li>
        <button @click="answerQuiz" class="button is-primary is-large">
          {{ pref2["name"] }}
        </button>
      </li>
    </ul>
    <div v-if="answered" class="block">
      <article class="message is-success" v-if="corrected">
        <div class="message-header">正解です</div>
        <div class="message-body">
          <p>{{ pref1["name"] }}：人口密度 {{ Number(pref1["density"]).toLocaleString() }} 人 / ㎢ <br /> 
          {{ pref2["name"] }}：人口密度 {{ Number(pref2["density"]).toLocaleString() }} 人 / ㎢ </p>
        </div>
      </article>
      <article class="message is-warning" v-if="!corrected">
        <div class="message-header">不正解です</div>
        <div class="message-body">
          <p>{{ pref1["name"] }}：人口密度 {{ Number(pref1["density"]).toLocaleString() }} 人 / ㎢ <br /> 
          {{ pref2["name"] }}：人口密度 {{ Number(pref2["density"]).toLocaleString() }} 人 / ㎢ </p>
        </div>
      </article>
    </div>
    <button @click="shuffleChoices" class="button is-primary is-light" v-if="answered">次の問題</button>
  </div>
</template>

<script>
import populations from '@/assets/population.json'

export default {
  name: 'QuizPage',
  props: {
  },
  data () {
    const shuffled = populations.sort(() => 0.5 - Math.random());
    let selected = shuffled.slice(0,2);
    return {
      pref1: selected[0],
      pref2: selected[1],
      quiz_completed: 0,
      quiz_corrected: 0,
      answered: false,
      corrected: false,
    }
  },
  methods: {
    shuffleChoices: function() {
      // populations からランダムに２つの県を取り出す
      const shuffled = populations.sort(() => 0.5 - Math.random());
      let selected = shuffled.slice(0,2);
      // 既存のprefと変わらなければ変更
      if ((this.pref1["name"] == selected[0]["name"]) && (this.pref2["name"] == selected[1]["name"])) {
        selected = shuffled.slice(2,4)
      }
      if ((this.pref2["name"] == selected[0]["name"]) && (this.pref1["name"] == selected[1]["name"])) {
        selected = shuffled.slice(2,4)
      }
      // 既存のprefを更新する
      this.pref1 = selected[0]
      this.pref2 = selected[1]
      // 回答数を１増やす
      this.quiz_completed++
      if (this.quiz_completed == 10) {
        this.$emit("parentMethod", 2)
        this.$emit("updateScore", this.quiz_corrected)
      }
      this.answered = false;
    },
    answerQuiz: function(event) {
      if (this.answered) {
        return
      }
      this.answered = true;
      // 正誤判定
      if (this.pref1["density"] > this.pref2["density"]) {
        if (this.pref1["name"] == event.target.innerText) {
          this.corrected = true
          this.quiz_corrected++
        } else {
          this.corrected = false
        }
      }
      if (this.pref2["density"] > this.pref1["density"]) {
        if (this.pref2["name"] == event.target.innerText) {
          this.corrected = true
          this.quiz_corrected++
        } else {
          this.corrected = false
        }
      }
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
