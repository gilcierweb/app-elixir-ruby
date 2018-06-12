require_relative '../app/models/repository'

Repository.destroy_all
Repository.create([
                      {user: 'geekcomputers', repository: 'Python', url: 'https://github.com/geekcomputers/Python', language: 'python'},
                      {user: 'rails', repository: 'rails', url: 'https://github.com/rails/rails', language: 'ruby'},
                      {user: 'ueberauth', repository: 'guardian', url: 'https://github.com/ueberauth/guardian', language: 'elixir'},
                      {user: 'hussien89aa', repository: 'KotlinUdemy', url: 'https://github.com/hussien89aa/KotlinUdemy', language: 'kotlin'},
                      {user: 'datasciencemasters', repository: 'go', url: 'https://github.com/datasciencemasters/go', language: 'go'},
                      {user: 'playframework', repository: 'playframework', url: 'https://github.com/playframework/playframework', language: 'scala'},
                      {user: 'vuetifyjs', repository: 'vuetify', url: 'https://github.com/vuetifyjs/vuetify', language: 'javascript'},
                      {user: 'gilcierweb', repository: 'simple-realtime-message', url: 'https://github.com/gilcierweb/simple-realtime-message', language: 'ruby'}

                  ])