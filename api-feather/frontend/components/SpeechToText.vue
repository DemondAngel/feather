<template>
  <div class="d-flex align-items-center">
    <button
      @click.stop="toggle ? endSpeechRecognition() : startSpeechRecognition()"
      type="button"
      class="btn btn-primary text-white"
      :class="!toggle ? 'btn-primary' : speaking ? 'btn-comp2' : 'btn-comp5'"
      :content="!toggle ? 'Empezar a grabar' : 'Detener grabación'"
      v-tippy
    >
      <i class="fas fa-microphone-alt"></i>
    </button>
    <input
      class="form-control ms-3 text-truncate"
      type="search"
      placeholder="Buscar producto"
      aria-label="Search"
      :value="getSentencesJoined"
      @input="$emit('changeInput', $event)"
    />
  </div>
</template>

<script>
let SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition
let recognition = SpeechRecognition ? new SpeechRecognition() : false

export default {
  props: {
    lang: {
      type: String,
      default: 'es-ES',
    },
    text: {
      type: [String, null],
      required: true,
    },
  },
  data() {
    return {
      error: false,
      speaking: false,
      toggle: false,
      runtimeTranscription: '',
      sentences: [],
    }
  },
  methods: {
    checkCompatibility() {
      if (!recognition) {
        this.error =
          'Speech Recognition is not available on this browser. Please use Chrome or Firefox'
      }
    },
    endSpeechRecognition() {
      recognition.stop()
      this.toggle = false
      this.$emit('speechend', {
        sentences: this.sentences,
        text: this.sentences.join(' '),
      })
    },
    startSpeechRecognition() {
      if (!recognition) {
        this.error =
          'Speech Recognition is not available on this browser. Please use Chrome or Firefox'
        return false
      }
      this.$emit('cleanupText')
      this.sentences = []
      this.toggle = true
      recognition.lang = this.lang
      recognition.interimResults = true

      recognition.addEventListener('speechstart', event => {
        this.speaking = true
      })

      recognition.addEventListener('speechend', event => {
        this.speaking = false
      })

      recognition.addEventListener('result', event => {
        const text = Array.from(event.results)
          .map(result => result[0])
          .map(result => result.transcript)
          .join('')
        this.runtimeTranscription = text
      })

      recognition.addEventListener('end', () => {
        if (this.runtimeTranscription !== '') {
          this.sentences.push(this.capitalizeFirstLetter(this.runtimeTranscription))
          this.$emit('update:text', `${this.text}${this.sentences.slice(-1)[0]}. `)
        }
        this.runtimeTranscription = ''
        recognition.stop()
        if (this.toggle) {
          // keep it going.
          recognition.start()
        }
      })
      recognition.start()
    },
    capitalizeFirstLetter(string) {
      return string.charAt(0).toUpperCase() + string.slice(1)
    },
  },
  computed: {
    getSentencesJoined() {
      return this.sentences.join('. ')
    },
  },
  mounted() {
    this.checkCompatibility()
  },
}
</script>
