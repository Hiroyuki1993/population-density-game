<template>
  <div>
    <h3 class="title">あなたのスコア</h3>
    <h2 class="title">10問中{{score}}問正解！</h2>
    <img src="@/assets/planning_suit_man_color.png" width="200px" v-if="score >= 7"/>
    <img src="@/assets/man_crying_color.png" width="200px" v-if="score < 7"/>
    <div class="block">
      <a 
      class="button is-link" 
      :href="twitterLink"
      target="_blank">
      Twitterへ投稿
      </a>
    </div>
    <div class="block">
      <button @click="updateGameStatus" class="button is-primary is-light">最初に戻る</button>
    </div>
  </div>
</template>
<script>

export default {
  name: 'ResultPage',
  props: {
    score: Number,
  },
  data () {
    const twitter_base_url = "https://twitter.com/intent/tweet"
    const message = `【４７都道府県人口密度クイズ】あなたの得点は10点中${this.score}点でした`
    const link = "https://example.com"
    return {
      twitterLink: twitter_base_url+"?text="+encodeURIComponent(message)+"&url="+link
    }
  },
  methods: {
    updateGameStatus () {
      this.$emit("parentMethod", 0)
    }
  }
}
</script>
