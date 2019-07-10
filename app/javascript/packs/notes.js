import Vue from 'vue/dist/vue.esm.js'
import Note from './components/note.vue'

var app = new Vue({
  el: '#app',
  components: {
    'note': Note,
  }
});

// import Vue from 'vue'
// import App from '../app.vue'

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     render: h => h(App)
//   }).$mount()
//   document.body.appendChild(app.$el)

//   console.log(app)
// })
