import React from 'react';

import GiphysIndexItem from './giphys_index_item';

function GiphysIndex({giphys}) {
  const giphysList = giphys.map( giphy =>
    <GiphysIndexItem key={giphy.id} giphy={giphy} />
    );
    
  return (
    <ul>
      {giphysList}
    </ul>
  );
}

export default GiphysIndex;
