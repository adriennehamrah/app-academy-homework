import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor() {
    super();
    this.state = {searchTerm: 'teddy bear'};
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    this.props.fetchSearchGiphys('teddy+bear');
  }

  handleChange(event) {
    this.setState({searchTerm: event.currentTarget.value});
  }

  handleSubmit(event) {
    event.preventDefault();
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    this.props.fetchSearchGiphys(searchTerm);
  }

  render() {
    let {giphys} = this.props;

    return(
      <div>
        <form className='search-bar'>
          <input onChange={this.handleChange} value={this.state.searchTerm} />
          <button type='submit' onClick={this.handleSubmit}>Search</button>
        </form>
        <GiphysIndex giphys={giphys}/>
      </div>
    );
  }
}

export default GiphysSearch;
