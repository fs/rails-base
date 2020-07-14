
import React from 'react'
import { shallow } from 'enzyme'
import HelloReact from 'packs/hello_world'

describe('HelloReact component', () => {
  describe('when a name is given as a prop', () => {
    it('render Hello Caique!', () => {
      expect(shallow().text()).toBe('Hello Caique!')
    })
  })

  describe('when no name is given', () => {
    it('render Hello David!', () => {
      expect(shallow().text()).toBe('Hello David!')
    })
  })
})
