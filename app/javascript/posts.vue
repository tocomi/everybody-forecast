<template>
  <div>
    <div class="post-table-div">
      <table class="post-table" border="1">
        <tr>
          <th class="post-header name">Name</th>
          <th class="post-header comment">Comment</th>
          <th class="post-header time">Time</th>
        </tr>
        <tr v-for="post in posts">
          <td class="name">{{ post.display_name }}</td>
          <td class="comment">{{ post.comment }}</td>
          <td class="time">{{ post.created_at }}</td>
        </tr>
      </table>
    </div>
    <div class="comment-area" v-if="login">
      <p class="comment-title">Comment</p>
      <textarea class="text-comment" v-model="comment"></textarea>
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
