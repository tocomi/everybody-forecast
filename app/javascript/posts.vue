<template>
  <div class="post-comment-main-div">
    <div class="post-table-div float-left">
      <div v-for="post in posts" class="post-div clearfix">
        <div class="name-time-div float-left">
          <div class="name">{{ post.display_name }}</div>
          <td class="time">{{ post.created_at }}</td>
        </div>
        <div class="comment-div float-left">
          <div class="comment">{{ post.comment }}</div>
        </div>
      </div>
    </div>
    <div class="comment-area" v-if="login">
      <p class="comment-title">Comment</p>
      <input class="text-comment" v-model="comment"></input>
      <button class="comment-button btn btn-primary" v-on:click="put_comment">post</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      posts: [],
      comment: '',
      login: false,
      current_user: null
    }
  },
  methods: {
    get_comments: function(race_id) {
      axios.get('../api/posts/' + race_id + '.json').then(
        res => {
          this.posts = res.data;
        }
      )
    },
    check_login: function() {
      axios.get('../api/users/current_user.json').then(
        res => {
          let current_user = res.data.current_user
          if (current_user === null) {
            this.login = false
            return
          }
          this.login = true
          this.current_user = current_user
        }
      )
    },
    put_comment: function() {
      if (this.comment === '') {
        return
      }
      this.posts.unshift({ display_name: this.current_user.display_name, comment: this.comment, created_at: Date.now() })
      axios.post('../api/posts', {
        race_id: location.search.match('[0-9]{12}')[0],
        user_id: this.current_user.id,
        comment: this.comment
      }).then(
        res => {
          this.comment = ''
          this.get_comments(location.search.match('[0-9]{12}')[0])
        }
      )
    }
  }
}
</script>

<style scoped>

</style>
