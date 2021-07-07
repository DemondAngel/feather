import gql from 'graphql-tag'
import { userFragment } from './fragments'

export const LOGIN = gql`
  mutation ($password: String!, $identifier: String!) {
    login(input: { password: $password, identifier: $identifier }) {
      jwt
      user {
        ...userInfo
      }
    }
  }
  ${userFragment}
`

export const REGISTER = gql`
  mutation ($email: String!, $password: String!, $username: String!) {
    register(input: { email: $email, password: $password, username: $username }) {
      jwt
      user {
        ...userInfo
      }
    }
  }
  ${userFragment}
`
