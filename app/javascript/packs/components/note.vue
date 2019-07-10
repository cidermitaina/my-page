<template>
  <section class="section" v-cloak>
    <div class="container">
      <h1 class="title has-text-left is-2">Note</h1>
      <h2 class="subtitle has-text-left is-6">入力するとメモができるページにしたい。</h2>
      <div class="field">
        <div class="field has-addons">
          <div class="control is-expanded has-icons-right">
            <input
              class="input"
              v-model="newNote"
              placeholder="ノートを入力..."
              @keyup.enter="createNote"
              @keypress="setCanMessageSubmit"
            >
            <span class="icon is-small is-right">
              <i class="fas fa-check"></i>
            </span>
          </div>
        </div>
      </div>
      <div class="tile-area">
        <ul class="is-multiline">
          <li class="column" v-for="(note, index) in notes">
            <div class="notification is-primary is-one-third">
              <button class="delete" v-on:click="deleteTodo(index, note.id)"></button>
              <p class="title">Note</p>
              <p class="subtitle has-text-left">{{ note.body }}</p>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </section>
</template>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
[v-cloak] {
  display: none;
}
.tile-area {
  margin-top: 3rem;
}
ul {
  column-count: 3;
  column-gap: 0;
}
@media screen and (max-width: 1024px) {
  ul {
    display: flex;
    flex-direction: column;
  }
}
li {
  page-break-inside: avoid;
  break-inside: avoid;
}
li:nth-child(2n) .notification {
  background-color: #209cee;
}
li:nth-child(3n) .notification {
  background-color: #23d160;
}
li:nth-child(5n) .notification {
  background-color: #ff3860;
}
li:nth-child(7n) .notification {
  background-color: #ffdd57;
  color: rgba(0, 0, 0, 0.7);
}
</style>

<script>
import axios from "axios";
axios.defaults.headers.common = {
  "X-Requested-With": "XMLHttpRequest",
  "X-CSRF-TOKEN": document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute("content")
};

export default {
  data: function() {
    return {
      canMessageSubmit: false,
      notes: [],
      newNote: ""
    };
  },
  mounted: function() {
    this.fetchNotes();
  },
  methods: {
    fetchNotes: function() {
      axios.get("/api/notes").then(
        response => {
          for (var i = 0; i < response.data.notes.length; i++) {
            this.notes.push(response.data.notes[i]);
          }
        },
        error => {
          console.log(error);
        }
      );
    },
    setCanMessageSubmit() {
      this.canMessageSubmit = true;
    },
    createNote: function() {
      if (!this.newNote) return;
      if (!this.canMessageSubmit) {
        return;
      }
      axios.post("/api/notes", { note: { body: this.newNote } }).then(
        response => {
          this.notes.unshift(response.data.note);

          this.newNote = "";
          this.canMessageSubmit = false;
        },
        error => {
          console.log(error.response);
        }
      );
    },
    deleteTodo(index, delete_id) {
      axios
        .delete(`/api/notes/${delete_id}`)
        .then(response => {
          this.notes.splice(index, 1);
        })
        .catch(() => {
          alert("エラー");
        });
    },
    setCanMessageSubmit() {
      this.canMessageSubmit = true;
    }
  }
};
</script>
