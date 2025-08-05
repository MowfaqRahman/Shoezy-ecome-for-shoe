import {
  HeartIcon,
  HomeIcon,
  MenuIcon,
  SearchIcon,
  ShoppingCartIcon,
  UserIcon,
} from "lucide-react";
import React from "react";
import { Button } from "../../components/ui/button";
import { Card } from "../../components/ui/card";
import { Input } from "../../components/ui/input";

export const Home = (): JSX.Element => {
  // Brand categories data
  const brands = [
    { name: "Nike", selected: true },
    { name: "Adidas", selected: false },
    { name: "Puma", selected: false },
  ];

  // Product cards data
  const products = [
    {
      id: 1,
      image: "..//frame-9.png",
      favorite: true,
      position: "top-[451px] left-[19px]",
    },
    {
      id: 2,
      image: "..//frame-7.png",
      favorite: false,
      position: "top-[451px] left-[220px]",
    },
    {
      id: 3,
      image: "..//frame-8.png",
      favorite: true,
      position: "top-0 left-[25px]",
    },
    {
      id: 4,
      image: "..//frame-7-1.png",
      favorite: false,
      position: "top-0 left-[226px]",
    },
  ];

  return (
    <div className="bg-neutral-100 grid justify-items-center [align-items:start] w-screen min-h-screen h-full">
      <div className="bg-neutral-100 overflow-hidden w-[412px] h-[917px] relative">
        {/* Profile Button */}
        <Button
          variant="outline"
          size="icon"
          className="w-[50px] h-[50px] top-[33px] left-[334px] bg-white rounded-[20px] absolute"
        >
          <UserIcon className="w-6 h-6" />
        </Button>

        {/* Title Section */}
        <div className="absolute w-[226px] top-[130px] left-9 [font-family:'Sora',Helvetica] font-normal text-black text-4xl text-justify tracking-[0.30px] leading-[54px]">
          <span className="tracking-[0.11px]">
            Our
            <br />
          </span>
          <span className="font-semibold tracking-[0.11px]">Products</span>
        </div>

        {/* SearchIcon Bar */}
        <div className="w-[354px] h-[53px] top-[261px] left-[29px] bg-[#eaeaea] rounded-[15px] opacity-50 absolute overflow-hidden flex items-center">
          <SearchIcon className="w-6 h-6 ml-3.5" />
          <Input
            className="border-none bg-transparent h-full pl-2 [font-family:'Sora',Helvetica] font-normal text-black text-xl tracking-[0.30px]"
            placeholder="search shoe"
          />
          <Button
            variant="outline"
            size="icon"
            className="w-[49px] h-[46px] ml-auto mr-1 bg-white rounded-[15px]"
          >
            <MenuIcon className="w-6 h-6" />
          </Button>
        </div>

        {/* Brand Categories */}
        <div className="absolute w-[539px] h-14 top-[362px] left-[29px] flex space-x-3">
          {brands.map((brand, index) => (
            <Button
              key={index}
              variant={brand.selected ? "outline" : "ghost"}
              className={`h-[55px] px-6 rounded-[15px] ${
                brand.selected
                  ? "border border-solid border-[#f36721] shadow-[0px_4px_20.7px_#f3672140]"
                  : "bg-white"
              }`}
            >
              <span
                className={`[font-family:'Sora',Helvetica] font-semibold ${brand.selected ? "text-[#343434]" : "text-black"} text-2xl tracking-[0.30px]`}
              >
                {brand.name}
              </span>
            </Button>
          ))}
        </div>

        {/* Product Cards - First Row */}
        <Card className="w-[172px] h-[197px] top-[451px] left-[19px] rounded-[20px] [background:url(../\/frame-9.png)_50%_50%_/_cover,linear-gradient(0deg,rgba(255,255,255,1)_0%,rgba(255,255,255,1)_100%)] absolute overflow-hidden border-none">
          <Button
            variant="ghost"
            size="icon"
            className="absolute top-[17px] left-[17px] p-0 h-6 w-6"
          >
            <HeartIcon className="w-6 h-6 fill-current text-red-500" />
          </Button>
        </Card>

        <Card className="w-[172px] h-[197px] top-[451px] left-[220px] rounded-[20px] [background:url(../\/frame-7.png)_50%_50%_/_cover,linear-gradient(0deg,rgba(255,255,255,1)_0%,rgba(255,255,255,1)_100%)] absolute overflow-hidden border-none">
          <Button
            variant="ghost"
            size="icon"
            className="absolute top-[17px] left-[17px] p-0 h-6 w-6"
          >
            <HeartIcon className="w-6 h-6" />
          </Button>
        </Card>

        {/* Product Cards - Second Row */}
        <div className="absolute w-[412px] h-[235px] top-[682px] -left-1.5">
          <Card className="w-[172px] h-[197px] top-0 left-[25px] rounded-[20px] [background:url(../\/frame-8.png)_50%_50%_/_cover,linear-gradient(0deg,rgba(255,255,255,1)_0%,rgba(255,255,255,1)_100%)] absolute overflow-hidden border-none">
            <Button
              variant="ghost"
              size="icon"
              className="absolute top-[17px] left-[17px] p-0 h-6 w-6"
            >
              <HeartIcon className="w-6 h-6 fill-current text-red-500" />
            </Button>
          </Card>

          <Card className="w-[172px] h-[197px] top-0 left-[226px] rounded-[20px] [background:url(../\/frame-7-1.png)_50%_50%_/_cover,linear-gradient(0deg,rgba(255,255,255,1)_0%,rgba(255,255,255,1)_100%)] absolute overflow-hidden border-none">
            <Button
              variant="ghost"
              size="icon"
              className="absolute top-[17px] left-[17px] p-0 h-6 w-6"
            >
              <HeartIcon className="w-6 h-6" />
            </Button>
          </Card>

          {/* Navigation Bar */}
          <div className="absolute w-[412px] h-[89px] top-[146px] left-0 shadow-[0px_0px_12.2px_#00000040]">
            <div className="relative h-[89px]">
              <div className="absolute w-[412px] h-[67px] top-[22px] left-0">
                <div className="h-[67px]">
                  <div className="w-[412px] h-[67px]">
                    <div className="relative h-[67px] bg-white rounded-[7px] overflow-hidden flex justify-around items-center">
                      <Button variant="ghost" size="icon" className="h-6 w-6">
                        <SearchIcon className="w-6 h-6" />
                      </Button>
                      <Button variant="ghost" size="icon" className="h-6 w-6">
                        <ShoppingCartIcon className="w-6 h-6" />
                      </Button>
                      <Button variant="ghost" size="icon" className="h-6 w-6">
                        <HeartIcon className="w-6 h-6" />
                      </Button>
                    </div>
                  </div>
                </div>
              </div>

              <div className="absolute w-[98px] h-[82px] top-0 left-2.5">
                <div className="relative h-[82px]">
                  <div className="absolute w-[98px] h-[82px] top-0 left-0 bg-[url(/ellipse-1.svg)] bg-[100%_100%]">
                    <div className="relative w-12 h-12 top-[9px] left-[25px] bg-[#f36721] rounded-3xl flex items-center justify-center">
                      <HomeIcon className="w-6 h-6 text-white" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
