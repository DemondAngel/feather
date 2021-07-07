import gql from 'graphql-tag'

export const userFragment = gql`
  fragment userInfo on UsersPermissionsMe {
    id
    role {
      name
    }
    username
    email
    confirmed
  }
`
