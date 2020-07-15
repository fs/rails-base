import React from 'react'
import { shallow } from 'enzyme'
import HelloWorld from 'packs/hello_world'

describe('HelloWorld component', () => {
  describe('when no name is given', () => {
    it('render Hello, World!', () => {
      const wrapper = shallow(<HelloWorld />);
      expect(wrapper.text()).toBe('Hello, World!')
    })
  })

  describe('when a name is given as a prop', () => {
    it('render Hello, David!', () => {
      const wrapper = shallow(<HelloWorld name='David' />);
      expect(wrapper.text()).toBe('Hello, David!')
    })
  })
})
