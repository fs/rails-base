import React from 'react'
import { shallow } from 'enzyme'
import HelloWorld from 'packs/hello_world'

describe('HelloWorld component', () => {
  describe('when a name is given as a prop', () => {
    it('render Hello Caique!', () => {
      expect(shallow().text()).toBe('Hello Caique!')
    })
  })

  describe('when no name is given', () => {
    it('render Hello, developer!', () => {
      expect(shallow().text()).toBe('Hello David!')
    })
  })
})
