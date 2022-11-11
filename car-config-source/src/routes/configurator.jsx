import { useParams } from "react-router-dom";
import PrimaryButton from "../react-assets/primary-button";
import SecondaryButton from "../react-assets/secondary-button";
import EnginesView from "../views/EnginesView";
import "./styles/configurator-style.css";
import axios from 'axios';
import React, { useEffect } from "react";
import { useState } from "react";
import ConfigContext from "../contexts/configcontext";
import ColorsView from "../views/ColorsView";

export default function Configurator() {
    let { carId } = useParams();

    const [carInfo, setCarInfo] = useState({
        id: 0,
        model_name: "null",
        base_price: "null",
        image_src: ""
    });

    const [config, setConfig] = useState({
        engineId: 0,
        colorId: 0,
        rimsId: 0,
        additional: [],
    });

    const [configViewIndex, setConfigViewIndex] = useState(0);
    const [configView, setConfigView] = useState(<EnginesView idCar={carId}/>);


    useEffect(() => {
        getCarInfo();
    }, []);

    function getCarInfo() {
        const url = `http://127.0.0.1:80/KrzysztofSkorzynski/car-config-reactrouter/API/models/${carId}`;
        axios.get(url)
            .then((response) => {
                console.log(response.data);
                setCarInfo(response.data);
            });
    }

    function getDefaults() {
        const url = `http://127.0.0.1:80/KrzysztofSkorzynski/car-config-reactrouter/API/defaultConfig/${carId}`;
        axios.get(url)
            .then((response) => {
                console.log(response.data);
                //setConfig
            })
    }

    function ChangeConfigView(i) {
        if (i >= 0) {
            setConfigViewIndex(i);
            console.log("view" + configViewIndex);

            switch (i) {
                case 0:
                    setConfigView(<EnginesView idCar={carId}/>);
                    break;
                case 1:
                    setConfigView(<ColorsView idCar={carId}/>);
                    break;
                default:
                    break;
            }
        }
    }

    const ContextObject = React.createContext(ConfigContext());

    return(
        <main>
            <ContextObject.Provider value={config}>
                <header>
                    Configure your dream car - {carInfo.model_name}!
                </header>
                <section>
                    <div className="gallery">
                        Galeria
                    </div>
                    <div className="options">
                        <header>
                            Select your Engine
                        </header>
                        <section>
                            {configView}
                        </section>
                        <footer>
                            <SecondaryButton text="Previous step" action={() => {
                                ChangeConfigView(configViewIndex - 1);
                            }}/>
                            <PrimaryButton text="Next step" action={() => {
                                ChangeConfigView(configViewIndex + 1);
                            }}/>
                        </footer>
                    </div>
                </section>
            </ContextObject.Provider>
        </main>
    );
}