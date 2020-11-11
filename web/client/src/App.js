import React from 'react';
import ImageUpload from './imageUpload';

import Title from '@atoms/Title.js';
import GlobalStyle from '@themes/GlobalStyle.js';
import Routes from '@pages/Routes.js';

export default function App() {
    return (
        <div>
            <Title
                backgroundColor="black"
                fontColor="white"
                width="100%"
                height="100px"
                text="ISSUE"
                padding="0px"
            ></Title>
            <Routes style={{ width: '100%' }}></Routes>
            <GlobalStyle />
        </div>
    );
}
